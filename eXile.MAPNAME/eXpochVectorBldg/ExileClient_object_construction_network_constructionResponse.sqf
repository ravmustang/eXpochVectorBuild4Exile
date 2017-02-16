/**
 * ExileClient_object_construction_network_constructionResponse
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
 
private["_objectNetID","_object"];
_objectNetID = _this select 0;
_object = objectFromNetId _objectNetID;
ExileClientConstructionObject = _object;
ExileClientConstructionCanPlaceObject = false;
[] spawn ExileClient_construction_thread;
[] call freeVectorBuilding;
true