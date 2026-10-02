GoatQuestMapIcon_Mixin = {}

local RADIUS_ADJ = -5

function GoatQuestMapIcon_Mixin:OnUpdate(elapsed)
	if self:IsDragging() then
		local minimap = self:GetParent()
		local radius = (minimap:GetWidth() + self:GetWidth()) / 2
		local width = self:GetWidth()
		local x,y = minimap:GetCenter()
		local sc = minimap:GetEffectiveScale()
		local mx,my = GetCursorPosition() --self:GetCenter()
		mx=mx/sc  my=my/sc
		local dx,dy=mx-x,my-y
		local dist = (dx*dx+dy*dy)^0.5

		local radmin=radius + RADIUS_ADJ
		local radsnap=radius+width*0.2
		local radpull=radius+width*0.7
		local radfre=radius+width

		local radclamp
		if dist<=radsnap then self.snapped=true radclamp=radmin
		elseif dist<radpull and self.snapped then radclamp=radmin
		elseif dist<radfre and self.snapped then radclamp=radmin+(dist-radpull)/2
		else self.snapped=false -- dobby is freeee
		end

		if radclamp then
			dx=dx/(dist/radclamp)
			dy=dy/(dist/radclamp)
		end

		self:ClearAllPoints()
		self:SetPoint("CENTER",self:GetParent(),"CENTER",dx,dy)
	end
end

function GoatQuestMapIcon_Mixin:Setup()
	GQ.F.AssignButtonTexture(self,GQ.SKINSDIR.."goatquest-minimap",1,2)
end

function GoatQuestMapIcon_Mixin:SetLoading(enable)
	if enable then
		self.loading = true
		self.spinner:SetTexture(GQ.SKINSDIR.."loading")
		self.spinner:Show()
		self.Loop:Play()
	else
		self.loading = false
		self.spinner:Hide()
	end
end

-- Left-click shows or hides the viewer (an active viewer style follows it).
-- Right-click opens the settings, or closes them when they are already open.
function GoatQuestMapIcon_Mixin:OnClick(button)
	GameTooltip:Hide()
	if button=="RightButton" then
		local menu = GQ.GuideMenu
		if menu.MainFrame and menu.MainFrame:IsVisible() and menu.CurrentPath=="Options" then
			menu:Hide()
		else
			GQ:OpenOptions()
		end
	else
		GQ:ToggleFrame()
	end
end
function GoatQuestMapIcon_Mixin:OnDragStart()
	self:StartMoving()
end

function GoatQuestMapIcon_Mixin:OnDragStop()
	self:StopMovingOrSizing()
	GQ.NotificationCenter:UpdatePosition()
end

function GoatQuestMapIcon_Mixin:OnLoad()
	self:RegisterForClicks("LeftButtonUp","RightButtonUp")
	self:RegisterForDrag("LeftButton")
end

function GoatQuestMapIcon_Mixin:OnEnter()
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:SetText(GQ.L['name'])
	GameTooltip:AddLine(GQ.L['minimap_tooltip'],1,1,1,true)
	GameTooltip:Show()
end

function GoatQuestMapIcon_Mixin:OnLeave()
	GameTooltip:Hide()
end