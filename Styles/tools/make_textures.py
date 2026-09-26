"""Regenerate the GoatQuest viewer textures in Styles/Textures.

Every texture is white on transparent so the Lua side tints it with
SetVertexColor. Output is uncompressed 32-bit TGA with a bottom-left origin,
the same format as the other GoatQuest-made textures in Skins/.

    py -3 Styles/tools/make_textures.py
"""
import math
import os
import struct

from PIL import Image, ImageDraw, ImageFilter

SS = 4  # supersampling factor
OUT = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "Textures")


def canvas(w, h):
    return Image.new("L", (w * SS, h * SS), 0)


def finish(mask, w, h, blur=0.0, alpha=1.0):
    img = mask.resize((w, h), Image.LANCZOS)
    if blur:
        img = img.filter(ImageFilter.GaussianBlur(blur))
    if alpha != 1.0:
        img = img.point(lambda v: int(v * alpha))
    return img


def save_tga(name, alpha_img, rgb=(255, 255, 255)):
    w, h = alpha_img.size
    a = alpha_img.tobytes()
    rows = []
    for y in range(h - 1, -1, -1):  # bottom-left origin
        row = bytearray()
        for x in range(w):
            row += bytes((rgb[2], rgb[1], rgb[0], a[y * w + x]))
        rows.append(bytes(row))
    header = struct.pack("<BBBHHBHHHHBB", 0, 0, 2, 0, 0, 0, 0, 0, w, h, 32, 0x08)
    with open(os.path.join(OUT, name + ".tga"), "wb") as f:
        f.write(header)
        f.write(b"".join(rows))
    print("wrote", name, w, h)


def pts(points, s=SS):
    return [(x * s, y * s) for x, y in points]


def chevron():
    # Filled arrowhead pointing up; the notch at the back gives it direction.
    w = h = 64
    m = canvas(w, h)
    d = ImageDraw.Draw(m)
    d.polygon(pts([(32, 5), (55, 55), (32, 43), (9, 55)]), fill=255)
    save_tga("chevron", finish(m, w, h))
    # Soft dark underlay drawn behind the tinted fill.
    m = canvas(w, h)
    d = ImageDraw.Draw(m)
    d.polygon(pts([(32, 3), (58, 58), (32, 46), (6, 58)]), fill=255)
    save_tga("chevron-shadow", finish(m, w, h, blur=2.2, alpha=0.75), rgb=(0, 0, 0))


def stroke_poly(name, points, w, h, width, closed=False):
    m = canvas(w, h)
    d = ImageDraw.Draw(m)
    seq = pts(points)
    if closed:
        seq = seq + [seq[0]]
    d.line(seq, fill=255, width=int(width * SS), joint="curve")
    r = width * SS / 2
    for x, y in seq:
        d.ellipse((x - r, y - r, x + r, y + r), fill=255)
    save_tga(name, finish(m, w, h))


def ellipse_ring(name, w, h, rx, ry, width, blur=0.0, alpha=1.0, rgb=(255, 255, 255)):
    m = canvas(w, h)
    d = ImageDraw.Draw(m)
    cx, cy = w / 2, h / 2
    d.ellipse(((cx - rx) * SS, (cy - ry) * SS, (cx + rx) * SS, (cy + ry) * SS), outline=255, width=int(width * SS))
    save_tga(name, finish(m, w, h, blur=blur, alpha=alpha), rgb=rgb)


def disc(name, size, r):
    m = canvas(size, size)
    d = ImageDraw.Draw(m)
    c = size / 2
    d.ellipse(((c - r) * SS, (c - r) * SS, (c + r) * SS, (c + r) * SS), fill=255)
    save_tga(name, finish(m, size, size))


def pin():
    w = h = 32
    m = canvas(w, h)
    d = ImageDraw.Draw(m)
    d.ellipse((7 * SS, 3 * SS, 25 * SS, 21 * SS), fill=255)
    d.polygon(pts([(9, 16), (23, 16), (16, 30)]), fill=255)
    d.ellipse((12.5 * SS, 8.5 * SS, 19.5 * SS, 15.5 * SS), fill=0)
    save_tga("pin", finish(m, w, h))


def main():
    os.makedirs(OUT, exist_ok=True)
    chevron()
    stroke_poly("vchev", [(6, 22), (16, 10), (26, 22)], 32, 32, 3.6)
    stroke_poly("check", [(7, 17), (13, 23), (25, 9)], 32, 32, 3.2)
    pin()
    ellipse_ring("ring", 512, 128, 250, 58, 4.5)
    ellipse_ring("ring-shadow", 512, 128, 250, 58, 11, blur=3.0, alpha=0.55, rgb=(0, 0, 0))
    disc("dot", 32, 13)


if __name__ == "__main__":
    main()
