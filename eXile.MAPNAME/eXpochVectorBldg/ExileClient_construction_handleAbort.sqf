/**
 * ExileClient_construction_handleAbort
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
 
private["_simulatePhysics"];
_simulatePhysics = _this;
switch (ExileClientConstructionResult) do
{
	case 1: 
	{
		if( ExileClientConstructionProcess isEqualTo 1) then
		{
			[player, ExileClientConstructionKitClassName] call ExileClient_util_playerCargo_remove;
		};
		[ExileClientConstructionObject, getText (ExileClientConstructionConfig >> "staticObject"), _simulatePhysics] spawn ExileClient_construction_simulationCountDown;
		if (getText (ExileClientConstructionConfig >> "staticObject") isEqualTo "Exile_Container_Safe") then 
		{
			["SuccessTitleAndText", ["Placed safe!", "The PIN has been set to 0000."]] call ExileClient_gui_toaster_addTemplateToast;
		}
		else
		{
			["SuccessTitleAndText", ["Placed object!", format ["You have successfully placed a %1.", ExileClientConstructionObjectDisplayName]]] call ExileClient_gui_toaster_addTemplateToast;
		};
	};
	case 3:
	{
		if (ExileClientConstructionProcess isEqualTo 2) then
		{
			[ExileClientConstructionObject, getText (ExileClientConstructionConfig >> "staticObject"), true] spawn ExileClient_construction_simulationCountDown;
		}
		else 
		{
			deleteVehicle ExileClientConstructionObject;
		};
		["ErrorTitleAndText", ["Construction aborted!", "Do not move more than 20 meters."]] call ExileClient_gui_toaster_addTemplateToast;
	};
	case 2:
	{
		if (ExileClientConstructionProcess isEqualTo 2) then
		{
			[ExileClientConstructionObject, getText(ExileClientConstructionConfig >> "staticObject"), _simulatePhysics] spawn ExileClient_construction_simulationCountDown;
		}
		else 
		{
			deleteVehicle ExileClientConstructionObject;
		};
		if (ExileClientPlayerIsInCombat) then
		{
			["ErrorTitleAndText", ["Construction aborted!", "You cannot build during a combat."]] call ExileClient_gui_toaster_addTemplateToast;
		}
		else
		{
			["ErrorTitleOnly", ["Construction aborted!"]] call ExileClient_gui_toaster_addTemplateToast;
		};		
	};
};
BuildPosX = 0;BuildPosY = 5;BuildPosZ = 0;
BuildVecYaw = 0;BuildVecPitch = 0;BuildVecRoll = 0;
(findDisplay 46) displayRemoveEventHandler ["KeyDown", keyDownEHId];
ExileClientConstructionObject = objNull;
ExileClientIsInConstructionMode = false;
ExileClientConstructionResult = 0;
ExileClientConstructionProcess = 0;
ExileClientConstructionLock = false;
true