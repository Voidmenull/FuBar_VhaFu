VhaFu = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceDB-2.0", "FuBarPlugin-2.0");
local Tablet = AceLibrary("Tablet-2.0");


VhaFu:RegisterDB("VanillaHealingAssignmentsFuDB");
VhaFu.hasIcon = "Interface\\AddOns\\VanillaHealingAssignments\\Media\\Icon";
VhaFu.defaultPosition = "LEFT";

if HealingAsssignments then HealingAsssignments.Minimap:Hide() end

local optionsTable = {
	handler = VhaFu,
	type = "group",
	args = {};
};

VhaFu:RegisterChatCommand({ "/Vha", "/VHA" }, optionsTable);
VhaFu.OnMenuRequest = optionsTable;

function VhaFu:OnTextUpdate()
	if (self:IsTextShown()) then
		self:ShowText();
		self:SetText("VHA");
	else
		self:HideText();
	end
end

function VhaFu:OnTooltipUpdate()
	local cat = Tablet:AddCategory(
		'columns', 1,
		'child_textR', 1,
		'child_textG', 1,
		'child_textB', 1,
		'child_text2R', 1,
		'child_text2G', 1,
		'child_text2B', 1
	)
	cat:AddLine(
		'text', "Left Click to show/hide menu."
	)
	cat:AddLine(
		'text', "Shift-Left Click to post open assignment window."
	)
end

function VhaFu:OnClick()
	if (arg1 == "LeftButton") then
		if (IsShiftKeyDown() or IsControlKeyDown()) then HealingAsssignments:PostAssignments()
		else
		if HealingAsssignments.Mainframe:IsVisible() then HealingAsssignments.Mainframe:Hide()
			else HealingAsssignments.Mainframe:Show() end
		end
	end
end