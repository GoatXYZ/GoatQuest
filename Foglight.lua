local _,GQ = ...

-- GLOBAL GoatQuestFogLightPinMixin

local Foglight = {}
GQ.Foglight = Foglight

function Foglight:Startup()
	if GQ.db.profile.foglight then
		Foglight:ShowOverlay()
	end
end

function Foglight:ShowOverlay()
	if GQ.IsDataProviderRegistered(WorldMapFrame,Foglight.DataProvider.name) then return end
	WorldMapFrame:AddDataProvider(GQ.Foglight.DataProvider)
end

function Foglight:HideOverlay()
	if not GQ.IsDataProviderRegistered(WorldMapFrame,Foglight.DataProvider.name) then return end
	WorldMapFrame:RemoveDataProvider(GQ.Foglight.DataProvider)
end

function Foglight:ToggleOverlay()
	if GQ.IsDataProviderRegistered(WorldMapFrame,Foglight.DataProvider.name) then 
		WorldMapFrame:RemoveDataProvider(GQ.Foglight.DataProvider)
	else
		WorldMapFrame:AddDataProvider(GQ.Foglight.DataProvider)
		-- todo - get a better fix for overlays not showing if provider is added while map frame is visible.
		-- no, RefreshAllData is not working
		if WorldMapFrame:IsVisible() then
			local map = WorldMapFrame:GetMapID()
			if map then
				WorldMapFrame:Hide()
				if GQ.IsClassicTBC then
					WorldMapFrame:Show()
					if not GetCVarBool("miniWorldMap") then
						WorldMapFrame:Maximize();
					else
						WorldMapFrame:Minimize();
					end
					WorldMapFrame:SetMapID(map)
				else
				OpenWorldMap(map)
			end
		end
	end
	end
end


Foglight.DataProvider = CreateFromMixins(MapCanvasDataProviderMixin);


Foglight.DataProvider.blizz_overlays = {}

Foglight.DataProvider.name = "GoatQuestFoglightDataProvider"


function Foglight.DataProvider:OnAdded(mapCanvas)
	MapCanvasDataProviderMixin.OnAdded(self, mapCanvas);
	-- a single permanent pin
	local pin = self:GetMap():AcquirePin("GoatQuestFogLightPinTemplate");
	pin:SetPosition(0.5, 0.5);
	self.pin = pin;

end

function Foglight.DataProvider:OnRemoved(mapCanvas)
	MapCanvasDataProviderMixin.OnRemoved(self, mapCanvas);
	--self:GetMap():RemoveAllPinsByTemplate("GoatQuestFogLightPinTemplate"); -- for some reason this errors out, and if disabled overlays hide fine...
end

function Foglight.DataProvider:OnShow()
	self:RegisterEvent("MAP_EXPLORATION_UPDATED");
end

function Foglight.DataProvider:OnHide()
	self:UnregisterEvent("MAP_EXPLORATION_UPDATED");
	self.pin:RemoveAllData()
end

function Foglight.DataProvider:OnEvent(event, ...)
	if event == "MAP_EXPLORATION_UPDATED" then
		self:RefreshAllData();
	end
end

function Foglight.DataProvider:OnMapChanged()
	local fullUpdate = true;
	self.pin:RefreshOverlays(fullUpdate);
end

function Foglight.DataProvider:RemoveAllData()
	self.pin:RemoveAllData();
end

function Foglight.DataProvider:RefreshAllData(fromOnShow)
	self.pin:RefreshOverlays(fromOnShow);
end

function Foglight.DataProvider:OnGlobalAlphaChanged()
	if not self.isWaitingForLoad then
		self.pin:RefreshAlpha();
	end
end

--[[ THE Pin ]]--
GoatQuestFogLightPinMixin = CreateFromMixins(MapCanvasPinMixin);

function GoatQuestFogLightPinMixin:OnLoad()
	self:SetIgnoreGlobalPinScale(true);
	self:UseFrameLevelType("PIN_FRAME_LEVEL_MAP_EXPLORATION");
	self.overlayTexturePool = CreateTexturePool(self, "ARTWORK", 0);
	self.highlightRectPool = CreateTexturePool(self, "ARTWORK", 0);		-- could be frames, but textures are lighter
	self.textureLoadGroup = CreateFromMixins(TextureLoadingGroupMixin);
end

function GoatQuestFogLightPinMixin:RemoveAllData()
	self.overlayTexturePool:ReleaseAll();
	self.highlightRectPool:ReleaseAll();
	self.textureLoadGroup:Reset();
	if not self.updateTrackisWaitingForLoad then
		self.isWaitingForLoad = nil;
	end
end

function GoatQuestFogLightPinMixin:RefreshAlpha()
	self:SetAlpha(self:GetMap():GetGlobalAlpha());
end

function GoatQuestFogLightPinMixin:OnUpdate(elapsed)
	self.updateTrackisWaitingForLoad = false
	if self.isWaitingForLoad and self:GetMap():AreDetailLayersLoaded() and self.textureLoadGroup:IsFullyLoaded() then
		self:RefreshAlpha();
		self.isWaitingForLoad = nil;
		self.textureLoadGroup:Reset();
	end
end

function GoatQuestFogLightPinMixin:RefreshOverlays(fullUpdate)
	self:RemoveAllData();
	if fullUpdate then
		self.updateTrackisWaitingForLoad = true
		self.isWaitingForLoad = true;
		self:SetAlpha(0);
	end

	local mapID = self:GetMap():GetMapID();

	local our_overlays = Foglight.DataProvider.data[mapID]
	if not our_overlays then return end

	-- Get Blizzard overlays
	local exploredMapTextures = C_MapExplorationInfo.GetExploredMapTextures(mapID);

	-- Mark already used overlays
	table.wipe(Foglight.DataProvider.blizz_overlays)
	if exploredMapTextures then
		for i,v in pairs(exploredMapTextures) do
			if v.fileDataIDs[1] then
				Foglight.DataProvider.blizz_overlays[v.fileDataIDs[1]] = true
			end
		end
	end
	
	-- remove them from our data, since they are already visible
	for i,overlay in pairs(our_overlays) do
		if Foglight.DataProvider.blizz_overlays[overlay[1][1]] then
			table.remove(our_overlays,i)
		end
	end

	
	self.layerIndex = self:GetMap():GetCanvasContainer():GetCurrentLayerIndex();
	local layers = C_Map.GetMapArtLayers(mapID);
	local layerInfo = layers[self.layerIndex];
	local TILE_SIZE_WIDTH = layerInfo.tileWidth;
	local TILE_SIZE_HEIGHT = layerInfo.tileHeight;

	for i, exploredTextureInfo in ipairs(our_overlays) do
		local numTexturesWide = ceil(exploredTextureInfo[2]/TILE_SIZE_WIDTH);
		local numTexturesTall = ceil(exploredTextureInfo[3]/TILE_SIZE_HEIGHT);
		local texturePixelWidth, textureFileWidth, texturePixelHeight, textureFileHeight;
		if not exploredTextureInfo.phase or GQ.InPhase(exploredTextureInfo.phase) then
			for j = 1, numTexturesTall do
				if ( j < numTexturesTall ) then
					texturePixelHeight = TILE_SIZE_HEIGHT;
					textureFileHeight = TILE_SIZE_HEIGHT;
				else
					texturePixelHeight = mod(exploredTextureInfo[3], TILE_SIZE_HEIGHT);
					if ( texturePixelHeight == 0 ) then
						texturePixelHeight = TILE_SIZE_HEIGHT;
					end
					textureFileHeight = 16;
					while(textureFileHeight < texturePixelHeight) do
						textureFileHeight = textureFileHeight * 2;
					end
				end
				for k = 1, numTexturesWide do
					local texture = self.overlayTexturePool:Acquire();
					if ( k < numTexturesWide ) then
						texturePixelWidth = TILE_SIZE_WIDTH;
						textureFileWidth = TILE_SIZE_WIDTH;
					else
						texturePixelWidth = mod(exploredTextureInfo[2], TILE_SIZE_WIDTH);
						if ( texturePixelWidth == 0 ) then
							texturePixelWidth = TILE_SIZE_WIDTH;
						end
						textureFileWidth = 16;
						while(textureFileWidth < texturePixelWidth) do
							textureFileWidth = textureFileWidth * 2;
						end
					end
					texture:SetWidth(texturePixelWidth);
					texture:SetHeight(texturePixelHeight);
					texture:SetTexCoord(0, texturePixelWidth/textureFileWidth, 0, texturePixelHeight/textureFileHeight);
					texture:SetPoint("TOPLEFT", exploredTextureInfo[4] + (TILE_SIZE_WIDTH * (k-1)), -(exploredTextureInfo[5] + (TILE_SIZE_HEIGHT * (j - 1))));
					texture:SetTexture(exploredTextureInfo[1][((j - 1) * numTexturesWide) + k]);

					texture:SetDrawLayer("ARTWORK", 0);
					texture:Show();
				end
			end
		end
	end
end

function GoatQuestFogLightPinMixin:CheckMouseButtonPassthrough() return false end
function GoatQuestFogLightPinMixin.SetPassThroughButtons() end

function GoatQuestFogLightPinMixin:OnCanvasScaleChanged()
	if self.layerIndex ~= self:GetMap():GetCanvasContainer():GetCurrentLayerIndex() then
		self:RefreshOverlays();
	end
end

function GoatQuestFogLightPinMixin:OnCanvasSizeChanged()
	self:SetSize(self:GetMap():DenormalizeHorizontalSize(1.0), self:GetMap():DenormalizeVerticalSize(1.0));
end