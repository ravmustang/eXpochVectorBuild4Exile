/**
 * ExileClient_construction_beginExistingObject
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 * 
	eXpochClient_FREE_vectorBuilding
	
	Made for Anarchy, adapted to eXpoch and ported into Altis Life and Operation BlockHead by DirtySanchez
	
	and NOW EXILE WILL FEEL THE FREE VECTOR, go get a job sellers of scripts, this is a modding community.
	Sharing is caring and douchebaggery is a bannable offense
	
	http://DonkeyPunch.INFO
 */
 
private["_previewObjectClassName"];
if (ExileClientPlayerIsInCombat) then
{
	["ErrorTitleAndText", ["Construction aborted!", "You cannot build during a combat."]] call ExileClient_gui_toaster_addTemplateToast;
}
else 
{
	ExileClientConstructionObject = _this;
	ExileClientConstructionCanPlaceObject = false;
	ExileClientConstructionConfig = ("getText(_x >> 'staticObject') == ExileClientConstructionObject" configClasses(configFile >> "CfgConstruction")) select 0;
	_previewObjectClassName = getText(ExileClientConstructionConfig >> "previewObject");
	ExileClientConstructionSnapToObjectClassNames = (ExileClientConstructionConfig >> "SnapObjects") call Bis_fnc_getCfgSubClasses;
	ExileClientConstructionProcess = 2;
	ExileClientConstructionRotation = 0; 
	ExileClientConstructionObjectDisplayName = getText(configFile >> "CfgVehicles" >> _previewObjectClassName >> "displayName");
	ExileClientConstructionOffset = [0,5,0];
	DPBEAClientObjAttachedTo = player;
	BuildVecYaw = 0;BuildVecPitch = 0;BuildVecRoll = 0;
	ExileClientConstructionMode = 1;
	ExileClientConstructionIsInSelectSnapObjectMode = true;
	ExileClientConstructionSupportSnapMode = count(ExileClientConstructionSnapToObjectClassNames) > 0;
	ExileClientConstructionCurrentSnapToObject = objNull;
	{
		player reveal _x;
	}
	forEach (player nearObjects  ["Exile_Construction_Abstract_Static", 20]); 
	["buildConstructionRequest", [_previewObjectClassName,ExileClientConstructionPosition]] call ExileClient_system_network_send;
};
true