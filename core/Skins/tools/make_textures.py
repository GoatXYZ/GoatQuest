"""Regenerate the GoatQuest skin textures in Skins/Default/GoatQuest.

The skin is flat: 1px lines, square corners, one accent colour (GoatQuest
gold). Shapes that the Lua side tints are white on transparent. The
check/radio atlas and the floating buttons are read by several consumers
through ButtonSets (normal, pushed, highlight, disabled rows), so their
colours are baked in.

Output is uncompressed 32-bit TGA with a bottom-left origin, power-of-two
sizes, the same format as Styles/tools/make_textures.py writes.

    py -3 Skins/tools/make_textures.py
"""
import os
import struct

from PIL import Image, ImageDraw

SS = 8  # supersampling factor
OUT = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "Default", "GoatQuest")

INK = (15, 17, 21)          # #0F1115
RIDGE = (27, 31, 37)        # #1B1F25
TEXT = (236, 234, 230)      # #ECEAE6
DIM = (111, 117, 126)       # #6F757E
GOLD = (245, 191, 41)       # #F5BF29
GOLD_PUSHED = (220, 170, 33)
WHITE = (255, 255, 255)


def save_tga(name, img):
    """Write an RGBA image as uncompressed 32-bit TGA, bottom-left origin."""
    img = img.convert("RGBA")
    w, h = img.size
    assert w & (w - 1) == 0 and h & (h - 1) == 0, (name, w, h)
    px = img.tobytes()
    rows = []
    for y in range(h - 1, -1, -1):
        row = bytearray()
        for x in range(w):
            r, g, b, a = px[(y * w + x) * 4:(y * w + x) * 4 + 4]
            row += bytes((b, g, r, a))
        rows.append(bytes(row))
    header = struct.pack("<BBBHHBHHHHBB", 0, 0, 2, 0, 0, 0, 0, 0, w, h, 32, 0x08)
    with open(os.path.join(OUT, name + ".tga"), "wb") as f:
        f.write(header)
        f.write(b"".join(rows))
    print("wrote", name, w, h)


def load_tga(name):
    return Image.open(os.path.join(OUT, name + ".tga")).convert("RGBA")


def layer(size, rgb, alpha, draw):
    """One colour layer at SS scale; draw(ImageDraw, s) paints the mask."""
    mask = Image.new("L", (size * SS, size * SS), 0)
    draw(ImageDraw.Draw(mask), SS)
    img = Image.new("RGBA", mask.size, rgb + (0,))
    img.putalpha(mask.point(lambda v: int(v * alpha)))
    return img


def flatten(size, layers):
    out = Image.new("RGBA", (size * SS, size * SS), (0, 0, 0, 0))
    for lay in layers:
        out = Image.alpha_composite(out, lay)
    # Resize premultiplied so edges do not pick up the colour of empty pixels.
    return out.convert("RGBa").resize((size, size), Image.BOX).convert("RGBA")


# Box geometry inside a 32px cell. ButtonSets pad cells by 1/16 of a cell,
# so a cell shows its inner 28px; drawn at 14px that is exactly 2:1.
CELL = 32
B0, B1 = 2, 30
LINE = 2  # 1px on screen


def square_outline(alpha, fill_alpha=0.0):
    def draw(d, s):
        d.rectangle((B0 * s, B0 * s, B1 * s - 1, B1 * s - 1), fill=255)
        d.rectangle(((B0 + LINE) * s, (B0 + LINE) * s, (B1 - LINE) * s - 1, (B1 - LINE) * s - 1), fill=0)
    layers = [layer(CELL, WHITE, alpha, draw)]
    if fill_alpha:
        layers.insert(0, layer(CELL, WHITE, fill_alpha, square_fill_draw))
    return layers


def square_fill_draw(d, s):
    d.rectangle((B0 * s, B0 * s, B1 * s - 1, B1 * s - 1), fill=255)


def check_draw(d, s):
    pts = [(8.6, 16.2), (13.4, 21.0), (23.4, 10.6)]
    seq = [(x * s, y * s) for x, y in pts]
    width = 3.4 * s
    d.line(seq, fill=255, width=int(width), joint="curve")
    r = width / 2
    for x, y in seq:
        d.ellipse((x - r, y - r, x + r, y + r), fill=255)


def circle_draw(radius):
    def draw(d, s):
        c = CELL / 2
        d.ellipse(((c - radius) * s, (c - radius) * s, (c + radius) * s - 1, (c + radius) * s - 1), fill=255)
    return draw


def ring_draw(radius, width):
    def draw(d, s):
        c = CELL / 2
        d.ellipse(((c - radius) * s, (c - radius) * s, (c + radius) * s - 1, (c + radius) * s - 1), fill=255)
        r = radius - width
        d.ellipse(((c - r) * s, (c - r) * s, (c + r) * s - 1, (c + r) * s - 1), fill=0)
    return draw


def checkradio():
    """ButtonSets.Interactions: columns CHECKBOX, CHECKBOX_ON, RADIO, RADIO_ON;
    rows normal, pushed, highlight (drawn with ADD), disabled."""
    R = (B1 - B0) / 2
    cells = {
        # CHECKBOX: 1px white 25% square, empty inside
        (0, 0): square_outline(0.25),
        (0, 1): square_outline(0.40),
        (0, 2): square_outline(0.30, fill_alpha=0.05),
        (0, 3): square_outline(0.10),
        # CHECKBOX_ON: gold square, ink check
        (1, 0): [layer(CELL, GOLD, 1, square_fill_draw), layer(CELL, INK, 1, check_draw)],
        (1, 1): [layer(CELL, GOLD_PUSHED, 1, square_fill_draw), layer(CELL, INK, 1, check_draw)],
        (1, 2): [layer(CELL, WHITE, 0.12, square_fill_draw)],
        (1, 3): [layer(CELL, DIM, 1, square_fill_draw), layer(CELL, INK, 1, check_draw)],
        # RADIO: the same, round
        (2, 0): [layer(CELL, WHITE, 0.25, ring_draw(R, LINE))],
        (2, 1): [layer(CELL, WHITE, 0.40, ring_draw(R, LINE))],
        (2, 2): [layer(CELL, WHITE, 0.05, circle_draw(R)), layer(CELL, WHITE, 0.30, ring_draw(R, LINE))],
        (2, 3): [layer(CELL, WHITE, 0.10, ring_draw(R, LINE))],
        # RADIO_ON: gold disc, ink dot
        (3, 0): [layer(CELL, GOLD, 1, circle_draw(R)), layer(CELL, INK, 1, circle_draw(4.5))],
        (3, 1): [layer(CELL, GOLD_PUSHED, 1, circle_draw(R)), layer(CELL, INK, 1, circle_draw(4.5))],
        (3, 2): [layer(CELL, WHITE, 0.12, circle_draw(R))],
        (3, 3): [layer(CELL, DIM, 1, circle_draw(R)), layer(CELL, INK, 1, circle_draw(4.5))],
    }
    atlas = Image.new("RGBA", (CELL * 4, CELL * 4), (0, 0, 0, 0))
    for (col, row), layers in cells.items():
        atlas.paste(flatten(CELL, layers), (col * CELL, row * CELL))
    save_tga("checkradio-flat", atlas)


def check():
    """White check mark, tinted gold in Lua (selected dropdown items)."""
    img = flatten(32, [layer(32, WHITE, 1, check_draw)])
    save_tga("check", img)


def scroll_bar():
    """ScrollBarTexture: quarters top cap, middle, bottom cap. Flat and thin:
    6 of 16 columns, so the usual 11px width draws a ~4px bar."""
    img = Image.new("RGBA", (16, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    d.rectangle((5, 0, 10, 63), fill=WHITE + (255,))
    save_tga("scroll-bar", img)


def floating_buttons():
    """ButtonSets.FloatingIcons (BROOM, WIDGETS, CLOSE): the glyphs of the old
    round buttons on flat ridge squares with a hairline border."""
    src = load_tga("floatingbuttons-thin")
    if src.getpixel((0, 0))[3] == 255:  # the old discs leave the corners empty
        print("floatingbuttons-thin already flat; skipped")
        return
    size = 32
    out = Image.new("RGBA", (size * 4, size * 4), (0, 0, 0, 0))
    border = tuple(int(c + 0.12 * (255 - c)) for c in RIDGE)
    for col in range(3):
        # Glyph mask from the normal row: white glyph over an orange disc.
        cell = src.crop((col * size, 0, (col + 1) * size, size))
        glyph = Image.new("L", (size, size), 0)
        gp, cp = glyph.load(), cell.load()
        for y in range(size):
            for x in range(size):
                r, g, b, a = cp[x, y]
                t = b / 255  # the disc is (254,97,0): blue measures how white a pixel is
                gp[x, y] = int(255 * t * a / 255)
        rows = [
            (RIDGE, border, TEXT),
            (INK, border, TEXT),
            None,
            (RIDGE, RIDGE, DIM),
        ]
        for row, spec in enumerate(rows):
            tile = Image.new("RGBA", (size, size), (0, 0, 0, 0))
            d = ImageDraw.Draw(tile)
            if spec is None:
                d.rectangle((0, 0, size - 1, size - 1), fill=WHITE + (20,))  # ADD highlight, ~8%
            else:
                fill, edge, ink = spec
                d.rectangle((0, 0, size - 1, size - 1), fill=edge + (255,))
                d.rectangle((1, 1, size - 2, size - 2), fill=fill + (255,))
                colour = Image.new("RGBA", (size, size), ink + (255,))
                colour.putalpha(glyph)
                tile = Image.alpha_composite(tile, colour)
            out.paste(tile, (col * size, row * size))
    save_tga("floatingbuttons-thin", out)


def guide_icons_small():
    """GuideIconsSmall: the favourite star (row 2, column 1) in GoatQuest gold."""
    img = load_tga("guideicons-small")
    px = img.load()
    changed = 0
    for y in range(32, 64):
        for x in range(0, 32):
            r, g, b, a = px[x, y]
            if a and r > 100 and g < r * 0.5 and b < r * 0.15:  # orange (254,97,0) and its shade
                k = r / 254
                px[x, y] = tuple(int(c * k) for c in GOLD) + (a,)
                changed += 1
    if changed:
        save_tga("guideicons-small", img)
    else:
        print("guideicons-small already gold; skipped")


def main():
    checkradio()
    check()
    scroll_bar()
    floating_buttons()
    guide_icons_small()


if __name__ == "__main__":
    main()
