local name,GQ=...

-- GoatQuest: the only skin style. It carries the Classbound viewer panel's
-- look into the rest of the UI: flat fills, 1px hairlines, square corners,
-- no glows or gradients, and one accent colour, GoatQuest gold. Styles saved
-- by older versions (starlight, stealth, the -glass variants) resolve to
-- this one in GQ:SetSkin.
--
-- The stock viewer frame is kept alive but invisible (see Styles/), and it
-- still reads many of these tokens, so every token it uses stays defined.

local STYLE = GQ.Skins:GetSkin("default"):AddStyle("goatquest","GoatQuest")

local SKIN=STYLE.skin
local SKINSDIR=GQ.SKINSDIR
local SKINDIR=SKIN:GetDir()
local STYLEDIR=STYLE:GetDir()
local WHITE_TEX=SKINSDIR.."white"

------------------- Palette (shared with Styles/Classbound.lua)
local INK       = {15/255,17/255,21/255,1}      -- #0F1115 window ground, sidebar
local INK_97    = {15/255,17/255,21/255,0.97}
local SLATE     = {21/255,24/255,29/255,1}      -- #15181D content column
local RIDGE     = {27/255,31/255,37/255,1}      -- #1B1F25 control fills, details pane, popups
local HAIRLINE  = {1,1,1,0.07}                  -- borders and dividers
local EDGE      = {1,1,1,0.12}                  -- control borders
local EDGE_HOVER= {1,1,1,0.22}
local FILL      = {1,1,1,0.08}                  -- neutral button fill
local FILL_HOVER= {1,1,1,0.14}
local HOVER     = {1,1,1,0.06}                  -- row and menu item hover
local SELECTED  = {1,1,1,0.08}                  -- selected row
local TEXT      = {0.925,0.918,0.902,1}         -- #ECEAE6
local SOFT      = {0.773,0.784,0.804,1}         -- #C5C8CD
local MUTED     = {0.553,0.576,0.612,1}         -- #8D939C secondary labels, inactive items
local DIM       = {0.435,0.459,0.494,1}         -- #6F757E disabled
local ACCENT    = {0.961,0.749,0.161,1}         -- #F5BF29 GoatQuest gold, the only colour
local ACCENT_HOVER = {0.969,0.800,0.325,1}      -- gold with 15% white
local WARNING   = {1,0.2,0,1}
local BLACK     = {0,0,0,1}
local WHITE     = {1,1,1,1}
local TRANSPARENT = {0,0,0,0}

STYLE.Transparent = TRANSPARENT
STYLE.Accent = ACCENT
STYLE.AccentHover = ACCENT_HOVER
STYLE.Ink = INK
STYLE.Slate = SLATE
STYLE.Ridge = RIDGE
STYLE.Hairline = HAIRLINE
STYLE.TextColor = TEXT
STYLE.MutedColor = MUTED
STYLE.DimColor = DIM

------------------- Backdrops
-- Fill and a 1px edge drawn over it; the edge colour is set separately.
local function Flat() return {bgFile=WHITE_TEX,edgeFile=WHITE_TEX,tile=true,tileSize=16,edgeSize=1,insets={left=0,right=0,top=0,bottom=0}} end
-- Fill inside the edge, for fills whose edge is the same colour (no darker rim).
local function FlatInset() return {bgFile=WHITE_TEX,edgeFile=WHITE_TEX,tile=true,tileSize=16,edgeSize=1,insets={left=1,right=1,top=1,bottom=1}} end
-- Fill only.
local function Fill() return {bgFile=WHITE_TEX,tile=true,tileSize=16,edgeSize=1,insets={left=0,right=0,top=0,bottom=0}} end

------------------- Global config
STYLE.ButtonHighlight = HOVER

STYLE.ViewerMargin = 0

STYLE.TitleButtons = STYLEDIR.."titlebuttons-thin"
STYLE.TitleLogo = SKINSDIR.."goatquest-icon"
STYLE.TitleLogoSize = {28,28}

STYLE.TitleButtonSize = 16
STYLE.TitleButtonInset = 2
STYLE.TitleButtonStepPrevNextSize = 14
STYLE.TitleButtonInsetHighlight = -3
STYLE.TitleButtonHighlightAlpha = 0.6

STYLE.StepNumFontSize = 14
STYLE.StepNumWidth = 40
STYLE.StepFontSizeMod = 1

STYLE.TopHeight = 55.5

STYLE.StyleAceGUI = true
STYLE.AceGUIFlat = true   -- AceGUI widgets draw flat 1px boxes instead of the slice textures

STYLE.UseOpacity = false

------------------- Templates
-- Window: ink with a hairline
STYLE.MainBackdrop=Flat()
STYLE.MainBackdropColor=SLATE
STYLE.MainBackdropBorderColor=TRANSPARENT

-- Large panels (guide menu, gold guide, gear finder, bug report)
STYLE.RoundedOpaqueBackdrop=Flat()
STYLE.RoundedOpaqueBackdropColor=INK_97
STYLE.RoundedOpaqueBackdropBorderColor=HAIRLINE

-- Small panels (action bar, notifications, home widgets)
STYLE.SmallOpaqueBackdrop=Flat()
STYLE.SmallOpaqueBackdropColor=INK_97
STYLE.SmallOpaqueBackdropBorderColor=HAIRLINE

-- Small bordered buttons
STYLE.SmallButtonBackdrop=Flat()
STYLE.SmallButtonBackdropColor=FILL
STYLE.SmallButtonBackdropBorderColor=EDGE

-- Borderless fill
STYLE.SecBackdrop=Fill()
STYLE.SecBackdropColor=SLATE

STYLE.TriBackdropColor=RIDGE

STYLE.DarkBorder=TRANSPARENT

STYLE.Backdrop=STYLE.MainBackdrop
STYLE.BackdropColor=STYLE.MainBackdropColor
STYLE.BackdropBorderColor=TRANSPARENT

STYLE.ActiveSectionColor=TEXT


------------------- Core elements (stock viewer, kept invisible)
STYLE.StepBackdrop=Fill()
STYLE.StepBorderBackdrop={bgFile=nil,edgeFile=WHITE_TEX,tile=true,edgeSize=1,tileSize=16,insets={left=0,right=0,top=0,bottom=0}}
STYLE.StepBackdropColor=SLATE
STYLE.StepBackdropBorderColor=SLATE
STYLE.StepBackdropPersistentBorder=true

STYLE.StepSpacing = 2
STYLE.StepStickyBarSpace = 5
STYLE.StepStickyBarHeight = 1
STYLE.StepStickySeparatorColor = HAIRLINE
STYLE.StepPaddingTop = 0
STYLE.StepPaddingBottom = 0
STYLE.StepPaddingWidth = 0

STYLE.StepLineBackBackdrop={bgFile=WHITE_TEX,tile=true,tileSize=6}
STYLE.StepLineBackBackdropColor=TRANSPARENT
STYLE.StepLineBackBackdropBorderColor=TRANSPARENT
STYLE.StepLineClickerBackdrop=STYLE.StepLineBackBackdrop
STYLE.StepLinePaddingWidth=3
STYLE.StepLinePaddingHeight=3
STYLE.StepLineIconOffset=3
STYLE.StepLineTextOffset=0
STYLE.StepLineIcons = STYLEDIR.."stepicons"
STYLE.StepLineIconSize = 1.1
STYLE.StepLineIconMarginRight = 3
STYLE.StepLineSpacing = 0

STYLE.MinimapIcon = SKINSDIR.."goatquest-button-states"

------------------- Widgets
-- Button (UiWidgets): 1 neutral, 2 accent, 3 neutral with an edge
STYLE.ButtonBackdrop1=Flat()
STYLE.ButtonColor1=FILL
STYLE.ButtonBorderColor1=TRANSPARENT
STYLE.ButtonHighlightColor1=FILL_HOVER
STYLE.ButtonTextColor1Over=TEXT
STYLE.ButtonTextColor1Out=TEXT

STYLE.ButtonBackdrop2=Fill()
STYLE.ButtonColor2=ACCENT
STYLE.ButtonHighlightColor2=ACCENT_HOVER
STYLE.ButtonTextColor2=INK

STYLE.ButtonBackdrop3=STYLE.SmallButtonBackdrop
STYLE.ButtonBorderColor3=EDGE
STYLE.ButtonHighlightColor3=FILL_HOVER
STYLE.ButtonBorderColorHighlightColor3=EDGE_HOVER

-- Dropdown (UiWidgets)
STYLE.DropDownBackdrop1=Flat()
STYLE.DropDownBackdrop1Color=RIDGE
STYLE.DropDownBackdrop2=Flat()
STYLE.DropDownBackdrop2Color=RIDGE
STYLE.DropDownBackdrop2BorderColor=EDGE
STYLE.DropDownButtonBackdrop2=Fill()
STYLE.DropDownButtonBackdrop2Color=TRANSPARENT
STYLE.DropDownPulloutBackdrop=Flat()
STYLE.DropDownPulloutColor=RIDGE
STYLE.DropDownPulloutBorderColor=EDGE
STYLE.DropDownItemBackdrop=Fill()
STYLE.DropDownItemColor=EDGE

-- Scrollbar: thin, thumb white 20%
STYLE.ScrollBackColor = TRANSPARENT
STYLE.ScrollBarColor = {1,1,1,0.2}
STYLE.ScrollBarTexture=STYLEDIR.."scroll-bar"
STYLE.ScrollBarArrowsTexture=STYLEDIR.."scroll-arrows"
STYLE.ScrollBarDecorHeight=16
STYLE.ScrollBarThumbWidth=4

-- Radio and checkboxes: ButtonSets.Interactions (CHECKBOX, CHECKBOX_ON, RADIO, RADIO_ON)
STYLE.InteractionTexture = STYLEDIR.."checkradio-flat"
STYLE.CheckMark = STYLEDIR.."check"   -- white, tint with Accent

-- Progress bar
STYLE.ProgressBarBackdrop = FlatInset()
STYLE.ProgressBarBackdropColor={1,1,1,0.08}
STYLE.ProgressBarBackdropBorderColor=TRANSPARENT
STYLE.ProgressBarTextureFile = WHITE_TEX
STYLE.ProgressBarTextureColor = ACCENT
STYLE.ProgressBarTextureFileOffset = {0,1/2,0,1/2}
STYLE.ProgressBarDecorUse = 0
STYLE.ProgressBarDecorFileOffset = TRANSPARENT
STYLE.ProgressBarCaps = STYLEDIR.."progressbarcaps"
STYLE.ProgressBarWidth = 4
STYLE.ProgressBarCapsColor = TRANSPARENT   -- square ends
STYLE.ProgressBarOffsetX = 5
STYLE.ProgressBarOffsetY = -4

-- Progress bar legacy, still used in some places.
STYLE.ProgressBarTexture = {1.0,1.0,1.0,1.0}
STYLE.ProgressBarTextureHeight = 5
STYLE.ProgressBarHeight = 7
STYLE.ProgressBarInset = 0
STYLE.ProgressBarColor = ACCENT
STYLE.ProgressBarColor2 = SOFT
STYLE.ProgressBarSpaceHeight = 16

-- Dropdown (UIDropDownFork based)
STYLE.UIDropDownBackdrop = Flat()
STYLE.UIDropDownBackdropColor = RIDGE
STYLE.UIDropDownBorderColor = EDGE
STYLE.UIDropDownLabelColor = TEXT


------------------- Specific objects
-- Main viewer frame
STYLE.WindowBackdrop=Flat()
STYLE.WindowBackdropFlipped = STYLE.WindowBackdrop
STYLE.WindowBackdropColor=TRANSPARENT
STYLE.WindowBackdropBorderColor=HAIRLINE

-- Main viewer frame, bottom part
STYLE.WindowBottomBackdrop=Flat()
STYLE.WindowBottomBackdropColor=SLATE
STYLE.WindowBottomBackdropBorderColor=HAIRLINE

-- Bar with step navigation
STYLE.SystemBarBackdropColor = RIDGE
STYLE.SystemBarBackdropBorderColor = TRANSPARENT

-- Floating menus (UIDropDownFork lists, notification center)
STYLE.FloatMenuBackdrop = Flat()
STYLE.FloatMenuBackdropColor = RIDGE
STYLE.FloatMenuBackdropBorderColor = EDGE
STYLE.FloatMenuSeparatorolor = HAIRLINE

STYLE.FloatMenuSmallBackdrop = Flat()
STYLE.FloatMenuSmallBackdropColor = RIDGE
STYLE.FloatMenuSmallBackdropBorderColor = EDGE

-- Search fields
STYLE.SearchBackdrop=Flat()
STYLE.SearchEditBackdropColor = RIDGE
STYLE.SearchEditBorderColor = EDGE
STYLE.SearchEditBorderColorHover = EDGE_HOVER
STYLE.SearchEditTextColor = MUTED
STYLE.SearchEditTextColorActive = TEXT

-- Options widgets (AceGUI)
STYLE.AceGUIInputTexture = STYLEDIR.."dropdown-opaque"   -- slice texture, only without AceGUIFlat

STYLE.AceGUIControlColor = RIDGE              -- flat dropdown / edit box fill
STYLE.AceGUIControlBorderColor = EDGE
STYLE.AceGUIControlBorderColorHover = EDGE_HOVER
STYLE.AceGUIChevronColor = MUTED
STYLE.AceGUITextColor = TEXT
STYLE.AceGUITextColorDisabled = DIM
STYLE.AceGUIDescColor = MUTED

STYLE.AceGUIDropDownBackdrop = Flat()
STYLE.AceGUIDropDownBackdropColor = RIDGE
STYLE.AceGUIDropDownBackdropBorderColor = EDGE

STYLE.AceGUIEditBackdrop = Flat()
STYLE.AceGUIEditBackdropMultiline = Flat()
STYLE.AceGUIEditBackdropColor = RIDGE
STYLE.AceGUIEditBackdropBorderColor = EDGE

STYLE.AceGUIGroupBackdrop = Flat()              -- inline groups
STYLE.AceGUIGroupBackdropColor = {1,1,1,0.02}
STYLE.AceGUIGroupBackdropBorderColor = HAIRLINE

STYLE.AceGUIButtonTexture = FlatInset()
STYLE.AceGUIButtonTextureColor = FILL
STYLE.AceGUIButtonHighlightColor = HOVER      -- over the fill: 8% becomes ~14%
STYLE.AceGUIButtonTextColor = TEXT
STYLE.AceGUIButtonTextColorDisabled = DIM
STYLE.AceGUIButtonAccentTextColor = INK
STYLE.AceGUIButtonFontSize = 12

STYLE.AceGUISliderBackdrop={bgFile=WHITE_TEX,tile=true,tileSize=8,edgeSize=1,insets={left=0,right=0,top=9,bottom=9}}
STYLE.AceGUISliderTrackColor = EDGE           -- 2px track
STYLE.AceGUISliderThumb=WHITE_TEX
STYLE.AceGUISliderThumbColor = ACCENT         -- slim gold bar
STYLE.AceGUISliderThumbSize = {4,14}

-- Action bar
STYLE.ActionBarBackdrop = STYLE.SmallOpaqueBackdrop
STYLE.ActionBarBackdropColor = STYLE.SmallOpaqueBackdropColor
STYLE.ActionBarBackdropBorderColor = STYLE.SmallOpaqueBackdropBorderColor

-- Find nearest
STYLE.FindNearestBackdrop = STYLE.SmallOpaqueBackdrop
STYLE.FindNearestBackdropColor = STYLE.SmallOpaqueBackdropColor
STYLE.FindNearestBackdropBorderColor = STYLE.SmallOpaqueBackdropBorderColor

-- Notification center
STYLE.NotificationBackdrop=STYLE.SmallOpaqueBackdrop
STYLE.NotificationBackdropColor=INK_97
STYLE.NotificationBackdropBorderColor=HAIRLINE
STYLE.NotificationDecorColor=HAIRLINE
STYLE.NotificationTextColor=SOFT
STYLE.NotificationTextColorOver=TEXT
STYLE.NotificationBubbleColor=ACCENT

STYLE.NotificationPopupShowHeader = false
STYLE.NotificationPopupHeaderBackdrop=STYLE.SmallOpaqueBackdrop
STYLE.NotificationPopupHeaderBackdropColor=INK
STYLE.NotificationPopupHeaderBackdropBorderColor=HAIRLINE
STYLE.NotificationPopupContentBackdrop=STYLE.SmallOpaqueBackdrop
STYLE.NotificationPopupContentBackdropColor=RIDGE
STYLE.NotificationPopupContentBackdropBorderColor=HAIRLINE

STYLE.MessageWarning = WARNING
STYLE.MessageNotify  = ACCENT

-- Guide menu (guides and settings window)
STYLE.GuideMenuMargin = 0
STYLE.GuideMenuHeaderFooterBackground = TRANSPARENT
STYLE.GuideMenuHeaderFooterBorder = TRANSPARENT
STYLE.GuideMenuSectionBorder = TRANSPARENT
STYLE.GuideMenuContentBackground = SLATE
STYLE.GuideMenuDetailsBackground = RIDGE
STYLE.GuideMenuFooterElementsOffset = 13
STYLE.GuideMenuSmallIcons = STYLEDIR.."guideicons-small"
STYLE.GuideMenuTinyMargin = 0
STYLE.GuideMenuGuideButtonDecorColor=ACCENT     -- 2px marker on the active sidebar item and tab
STYLE.GuideMenuTopRuleColor=ACCENT              -- 2px rule along the top edge, as on the viewer panel
STYLE.GuideMenuTopRuleHeight=2
STYLE.GuideMenuRuleColor=HAIRLINE               -- header and sidebar dividers
STYLE.GuideMenuBackdrop = Flat()
STYLE.GuideMenuBackdropColor = INK_97
STYLE.GuideMenuBackdropBorderColor = HAIRLINE
STYLE.GuideMenuMenuBackground = Fill()          -- sidebar: the window's ink shows through
STYLE.GuideMenuMenuBackgroundColor = TRANSPARENT
STYLE.GuideMenuMenuBackdropBorderColor = TRANSPARENT
STYLE.GuideMenuDetailsBackdrop = Fill()
STYLE.GuideMenuDetailsBackdropColor = RIDGE
STYLE.GuideMenuDetailsBackdropBorderColor = TRANSPARENT
STYLE.GuideMenuContentBackdrop = Fill()
STYLE.GuideMenuContentBackdropColor = SLATE
STYLE.GuideMenuContentBackdropBorderColor = TRANSPARENT

STYLE.GuideMenuItemColor = MUTED                -- sidebar items and header tabs
STYLE.GuideMenuItemColorActive = TEXT
STYLE.GuideMenuItemActiveFill = {1,1,1,0.04}
STYLE.GuideMenuRowSelectedColor = SELECTED
STYLE.GuideMenuTitleColor = TEXT
STYLE.GuideMenuTextColor = TEXT
STYLE.GuideMenuTextColorMissing = DIM

STYLE.GuideMenuExpandedBackdrop = Fill()
STYLE.GuideMenuExpandedBackdropColor = RIDGE
STYLE.GuideMenuExpandedBackdropBorderColor = RIDGE

STYLE.GuideMenuFeaturedDropdown = Flat()
STYLE.GuideMenuFeaturedDropdownBackdropColor = RIDGE
STYLE.GuideMenuFeaturedDropdownBackdropBorderColor = EDGE

STYLE.GuideMenuCardBackdrop = Flat()            -- featured sections
STYLE.GuideMenuCardColor = RIDGE
STYLE.GuideMenuCardBorderColor = HAIRLINE

-- Gold Guide
STYLE.GoldguideBackdrop=STYLE.RoundedOpaqueBackdrop
STYLE.GoldguideBackdropColor=STYLE.RoundedOpaqueBackdropColor
STYLE.GoldguideBackdropBorderColor=STYLE.RoundedOpaqueBackdropBorderColor
STYLE.GoldguideHeaderFooterColor=STYLE.GuideMenuHeaderFooterBackground

-- World Quests
STYLE.WorldQuestBackdrop=STYLE.RoundedOpaqueBackdrop
STYLE.WorldQuestBackdropColor=STYLE.RoundedOpaqueBackdropColor
STYLE.WorldQuestBackdropBorderColor=STYLE.RoundedOpaqueBackdropBorderColor
STYLE.WorldQuestMargin = 0

-- Tabs (stock viewer)
STYLE.TabsMargin = 0
STYLE.TabsHeight = 20
STYLE.TabsIconSize = 12
STYLE.TabsIcons = SKINSDIR.."guideicons-big"
STYLE.TabsBackdrop=STYLE.MainBackdrop
STYLE.TabsBackdropActive=WHITE
STYLE.TabsBackdropInactive=TRANSPARENT
STYLE.TabsContainerBackdropActive=RIDGE
STYLE.TabsContainerBackdropInactive=INK
STYLE.TabsBorderColor=TRANSPARENT
STYLE.TabsSeparatorTexture=WHITE_TEX
STYLE.TabsTextColor=TEXT
STYLE.TabsTextColorOver=MUTED
STYLE.TabsBusyIcon = SKINSDIR.."loading"
STYLE.TabsDecor = STYLEDIR.."viewer8-tabs"
STYLE.TabsDecorWidth = 8
STYLE.TabsTopOffset = -5
STYLE.TabsSeparatorColor = TRANSPARENT
STYLE.TabsFirstOffset = 4

-- Auction tools
STYLE.AuctionToolsMargin = 0
STYLE.AuctionToolsBackdrop = STYLE.RoundedOpaqueBackdrop
STYLE.AuctionToolsBackdropColor = STYLE.RoundedOpaqueBackdropColor
STYLE.AuctionToolsBackdropBorderColor = STYLE.RoundedOpaqueBackdropBorderColor
STYLE.AuctionToolsPriceIcons = SKINSDIR.."goldpricestatusicons"
STYLE.AuctionToolsHeaderFooterBackground = TRANSPARENT
STYLE.AuctionToolsHeaderFooterBorder = TRANSPARENT

-- Bug report
STYLE.BugBackdrop=STYLE.RoundedOpaqueBackdrop
STYLE.BugBackdropColor=STYLE.RoundedOpaqueBackdropColor
STYLE.BugBackdropBorderColor=STYLE.RoundedOpaqueBackdropBorderColor
STYLE.BugEditBackdrop=STYLE.SecBackdrop
STYLE.BugEditBackdropColor=RIDGE

-- Gearfinder
STYLE.GearFinderBackdrop = STYLE.RoundedOpaqueBackdrop
STYLE.GearFinderBackdropColor = STYLE.RoundedOpaqueBackdropColor
STYLE.GearFinderBackdropBorderColor = STYLE.RoundedOpaqueBackdropBorderColor

-- Home screen widgets: ridge cards on the slate column
STYLE.WidgetsBackdrop = Flat()
STYLE.WidgetsBackdropColor = RIDGE
STYLE.WidgetsBackdropBorderColor = HAIRLINE

STYLE.WidgetsPopupBackdropColor = RIDGE
STYLE.WidgetsPopupBackdropBorderColor = EDGE

STYLE.WidgetsTextColor = TEXT
STYLE.WidgetsDragColor = FILL_HOVER

STYLE.FloatingButtons = STYLEDIR.."floatingbuttons-thin"

------------------- Legacy / unused
-- Creature viewer
STYLE.CreatureBackdrop=STYLE.MainBackdrop
STYLE.CreatureBackdropColor=STYLE.MainBackdropColor
STYLE.CreatureBackdropBorderColor=TRANSPARENT
STYLE.CreatureViewerLabelBackground = STYLE.SecBackdropColor
STYLE.CreatureViewerLabelColor = TEXT
STYLE.CreatureViewerGap = {-10,0}
STYLE.CVNoModelTexture = SKINSDIR.."goatquest-icon"

-- Scan frame button
STYLE.MoneyBackdrop=STYLE.MainBackdrop
STYLE.MoneyBackdropColor=STYLE.MainBackdropColor
STYLE.MoneyBackdropBorderColor=TRANSPARENT

STYLE.TransparencyPrimary = 1
STYLE.TransparencySecondary = 1

STYLE.TabBackdrop={bgFile=WHITE_TEX}
STYLE.TabBackdropColor={0,0,0,0.0} -- the splitter is invisible
STYLE.StepnumBackdropColor={0,0,0,0.0} -- so is stepnumber
