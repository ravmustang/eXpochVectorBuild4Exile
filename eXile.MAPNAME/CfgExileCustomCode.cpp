/**
 * config.cpp class CfgExileCustomCode
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

class CfgExileCustomCode 
{
	/*
		You can overwrite every single file of our code without touching it.
		To do that, add the function name you want to overwrite plus the 
		path to your custom file here. If you wonder how this works, have a
		look at our bootstrap/fn_preInit.sqf function.

		Simply add the following scheme here:

		<Function Name of Exile> = "<New File Name>";

		Example:

		ExileClient_util_fusRoDah = "myaddon\myfunction.sqf";
	*/
	ExileClient_object_construction_move = "eXpochVectorBldg\ExileClient_object_construction_move.sqf";
	ExileClient_gui_hud_event_onKeyDown = "eXpochVectorBldg\ExileClient_gui_hud_event_onKeyDown.sqf";
	ExileClient_gui_hud_event_onKeyUp = "eXpochVectorBldg\ExileClient_gui_hud_event_onKeyUp.sqf";
	ExileClient_construction_beginExistingObject = "eXpochVectorBldg\ExileClient_construction_beginExistingObject.sqf";
	ExileClient_construction_beginNewObject = "eXpochVectorBldg\ExileClient_construction_beginNewObject.sqf";
	ExileClient_construction_thread = "eXpochVectorBldg\ExileClient_construction_thread.sqf";
	ExileClient_gui_constructionMode_update = "eXpochVectorBldg\ExileClient_gui_constructionMode_update.sqf";
	ExileClient_util_world_canBuildHere = "eXpochVectorBldg\ExileClient_util_world_canBuildHere.sqf";
};
