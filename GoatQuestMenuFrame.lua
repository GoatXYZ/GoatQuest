local name,GQ = ...
--GOATQUESTFRAME_TITLE = "GoatQuest";
GOATQUESTFRAME_TITLE = " ";

-- GLOBAL GoatQuestFrame_HighlightCurrentStep,GoatQuestFrame_OnHide,GoatQuestFrame_OnLoad,GoatQuestFrame_OnShow,GOATQUESTFRAME_TITLE,GoatQuestFrame_Update

function GoatQuestFrame_OnLoad()
end

function GoatQuestFrame_OnHide()
	GQ:Frame_OnHide();
end

function GoatQuestFrame_OnLoad()
	--
end

function GoatQuestFrame_OnShow()
	GQ:Frame_OnShow();
end

function GoatQuestFrame_Update()
	if GQ then GQ:UpdateMainFrame() end
end

function GoatQuestFrame_HighlightCurrentStep()
	if GQ.CurrentStep then GQ:HighlightCurrentStep() end
end