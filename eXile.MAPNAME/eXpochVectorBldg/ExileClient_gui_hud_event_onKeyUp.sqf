/**
 * ExileClient_gui_hud_event_onKeyUp
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_stopPropagation","_caller","_keyCode","_shiftState","_controlState","_altState","_posObject","_step"];
_stopPropagation = false;
_caller = _this select 0;
_keyCode = _this select 1;
_shiftState = _this select 2;
_controlState = _this select 3;
_altState = _this select 4;
if (_keyCode in (actionKeys "TacticalView")) exitWith {true};
if (_keyCode in (actionKeys "User1") && !(_keyCode isEqualTo 0x02)) exitWith 
{
	if !(ExileClientIsHandcuffed) then 
	{
		call ExileClient_object_vehicle_interaction_keyLock;
	};
	true
};
if (_keyCode in (actionKeys "User2")) exitWith
{
	if (ExileClientAllowPartyMarkers) then 
	{
		if !(ExileClientPartyID isEqualTo -1) then 
		{
			if !(ExileClientIsHandcuffed) then 
			{
				call ExileClient_system_party_updateMyMarker;	
			};
		};
	};
	true
};
switch (_keyCode) do  
{ 
	case 0x29:	
	{ 
		call ExileClient_gui_hud_toggleStatsBar;
		_stopPropagation = true; 
	}; 
	case 0x11,
	case 0x1E,
	case 0x1F,
	case 0x20:
	{
		if (ExileClientIsAutoRunning) then
		{
			call ExileClient_system_autoRun_stop;
			_stopPropagation = true; 
		};
	};
	case 0x0B:	 	
	{ 
		if !(ExileClientIsHandcuffed) then 
		{
			call ExileClient_system_autoRun_toggle;
		};
		_stopPropagation = true; 
	};
	case 0x08: 	{ _stopPropagation = true; };
	case 0x09: 	{ _stopPropagation = true; };
	case 0x0A: 	{ _stopPropagation = true; };
	case 0x3B: 	{ _stopPropagation = true; };
	case 0x3C: 	{ _stopPropagation = true; };
	case 0x3D:	{ _stopPropagation = true; };
	case 0x3E:	{ _stopPropagation = true; };
	case 0x41: 	{ _stopPropagation = true; };
	case 0x42:	{ _stopPropagation = true; };
	case 0x43: 	{ _stopPropagation = true; };
	case 0x44:	{ _stopPropagation = true; };
	case 0x57: 	{ _stopPropagation = true; };
	case 0x58: 	{ _stopPropagation = true; };
	case 0x0E: 	{ _stopPropagation = true; };
	case 0x02: 	
	{ 
		if !(ExileClientIsHandcuffed || ExileIsPlayingRussianRoulette) then 
		{
			if (ExileClientIsInConstructionMode) then
			{
				ExileClientConstructionObject setObjectTextureGlobal [0, "#(argb,2,2,1)color(0.7,0.93,0,0.6,ca)"];
				ExileClientConstructionCurrentSnapToObject = objNull;
				ExileClientConstructionIsInSelectSnapObjectMode = false;
				ExileClientConstructionPossibleSnapPositions = [];
				ExileClientConstructionMode = 1; 
				[] call ExileClient_gui_constructionMode_update;
			}
			else 
			{
				if (primaryWeapon player != "") then
				{
					if (primaryWeapon player != currentWeapon player) then
					{
						player selectWeapon (primaryWeapon player);
					};
				};
			};
		};
		_stopPropagation = true; 
	};
	case 0x03: 	
	{ 
		if !(ExileClientIsHandcuffed || ExileIsPlayingRussianRoulette) then 
		{
			if (ExileClientIsInConstructionMode) then
			{
				ExileClientConstructionObject setObjectTextureGlobal [0, "#(argb,2,2,1)color(0.7,0.93,0,0.6,ca)"];
				ExileClientConstructionCurrentSnapToObject = objNull;
				ExileClientConstructionIsInSelectSnapObjectMode = false;
				ExileClientConstructionPossibleSnapPositions = [];
				ExileClientConstructionMode = 2; 
				[] call ExileClient_gui_constructionMode_update;
			}
			else 
			{
				if (handgunWeapon player != "") then
				{
					if (handgunWeapon player != currentWeapon player) then
					{
						player selectWeapon (handgunWeapon player);
					};
				};
			};
		};
		_stopPropagation = true; 
	};
	case 0x04: 	
	{ 
		if !(ExileClientIsHandcuffed || ExileIsPlayingRussianRoulette) then 
		{
			if (ExileClientIsInConstructionMode) then
			{
				if (ExileClientConstructionSupportSnapMode) then
				{
					if (ExileClientConstructionMode != 3) then 
					{
						ExileClientConstructionCurrentSnapToObject = objNull; 
						ExileClientConstructionPossibleSnapPositions = [];
						["InfoTitleAndText", ["Snap Mode", "Look at the object you want to snap to, press SPACE to lock on it and then move your object next to a snap point. Press SPACE again to place the object."]] call ExileClient_gui_toaster_addTemplateToast;
					};
					ExileClientConstructionMode = 3; 
					ExileClientConstructionIsInSelectSnapObjectMode = true;
					[] call ExileClient_gui_constructionMode_update;
				};
			}
			else 
			{
				if (secondaryWeapon player != "") then
				{
					if (secondaryWeapon player != currentWeapon player) then
					{
						player selectWeapon (secondaryWeapon player);
					};
				};
			};
		};
		_stopPropagation = true; 
	};
	case 0x05: 	
	{ 
		if !(ExileClientIsHandcuffed || ExileIsPlayingRussianRoulette) then 
		{
			if (ExileClientIsInConstructionMode) then
			{
				if !(ExileClientConstructionKitClassName isEqualTo "Exile_Item_Flag") then 
				{
					ExileClientConstructionModePhysx = !ExileClientConstructionModePhysx;
					[] call ExileClient_gui_constructionMode_update;
				};
			}
			else
			{
				if (currentWeapon player != "") then
				{
					ExileClientPlayerHolsteredWeapon = currentWeapon player;
					player action["switchWeapon", player, player, 100];
				}
				else 
				{
					if (ExileClientPlayerHolsteredWeapon != "") then
					{
						player selectWeapon ExileClientPlayerHolsteredWeapon;
					};
				};
			};
		};
		_stopPropagation = true;
	};
	case 0x06:
	{
		if (ExileClientIsInConstructionMode) then
		{
			ExileClientConstructionShowHint = !ExileClientConstructionShowHint;
			[] call ExileClient_gui_constructionMode_update;
		}
		else 
		{
			call ExileClient_system_music_earplugs_toggle;
		};
		_stopPropagation = true;
	};
	case 0x07:
	{
		if (getText(missionConfigFile >> "Header" >> "gameType") isEqualTo "Escape") then 
		{
			if (alive player) then
			{
				[] call ExileClient_gui_hud_toggleEscapeStats;
			};	
		}
		else
		{
			if (ExileClientIsInConstructionMode) then
			{
				if(ExileClientConstructionLock)then
				{
					ExileClientConstructionLock = false;
					_posObject = position ExileClientConstructionObject;
					ExileClientConstructionOffset = player worldToModel _posObject;
					ExileClientConstructionRotation = (getDir ExileClientConstructionObject) - (getDir player);
				}
				else
				{
					ExileClientConstructionLock = true;
				};	
			}
			else
			{
				if (!ExileClientXM8IsVisible) then
				{
					if ("Exile_Item_XM8" in (assignedItems player)) then
					{
						if (alive player) then
						{
							[] call ExileClient_gui_xm8_show;
						};	
					};
				};
			};
		};
		_stopPropagation = true;
	};
	case 0x39:
	{
		if (ExileIsPlayingRussianRoulette) then
		{
			if (ExileRussianRouletteCanFire) then 
			{
				[] spawn ExileClient_system_russianRoulette_fire;
			};
		}
		else 
		{
			if (ExileClientIsInConstructionMode) then
			{
				if (ExileClientConstructionMode == 3) then 
				{
					if (ExileClientConstructionIsInSelectSnapObjectMode) then 
					{
						if !(isNull ExileClientConstructionCurrentSnapToObject) then
						{
							ExileClientConstructionIsInSelectSnapObjectMode = false;
							[] call ExileClient_gui_constructionMode_update;
						};
					}
					else 
					{
						if (ExileClientConstructionCanPlaceObject) then
						{
							ExileClientConstructionResult = 1;
						};
					};
				}
				else 
				{
					if (ExileClientConstructionCanPlaceObject) then
					{
						ExileClientConstructionResult = 1;
					};
				};
				_stopPropagation = true;
			};
		};
	};
	case 0x01:
	{
		if (ExileIsPlayingRussianRoulette) then 
		{
			_stopPropagation = true;
		}
		else 
		{
			if (ExileClientIsInConstructionMode) then
			{
				_stopPropagation = true;
			};
		};
	};
	case 0x10:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x12:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x47:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x49:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x19:
	{
		if (ExileClientIsInBush) then
		{
			call ExileClient_object_bush_detach;
			_stopPropagation = true;
		};
	};
	case 0x31:
	{
		if!(isNull ExileClientCameraParentObject)then
		{
			if(ExileClientCameraNVG)then
			{
				camUseNVG false;
			}
			else
			{
				camUseNVG true;
			};	
			ExileClientCameraNVG = !ExileClientCameraNVG;
			_stopPropagation = true;
		};
	};
	case 0xC9: 
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 0.5;
			if(_shiftState)then{_step = 1.5;};
			if(_controlState)then{_step = 0.1;};
			if(_altState)then{_step = 0.01;};
			if!(ExileClientConstructionMode isEqualTo 4)then
			{
				ExileClientConstructionOffset set [2, ((((ExileClientConstructionOffset select 2) + _step) min 6) max -3) ];
			}else{
				ExileClientConstructionOffset set [2,((ExileClientConstructionOffset select 2) + _step)];
			};
			[] call ExileClient_gui_constructionMode_update;
			_stopPropagation = true;
		};
	};
	case 0xD1: 
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 0.5;
			if(_shiftState)then{_step = 1.5;};
			if(_controlState)then{_step = 0.1;};
			if(_altState)then{_step = 0.01;};
			if!(ExileClientConstructionMode isEqualTo 4)then
			{
				ExileClientConstructionOffset set [2, ((((ExileClientConstructionOffset select 2) - _step) min 6) max -3) ];
			}else{
				ExileClientConstructionOffset set [2,((ExileClientConstructionOffset select 2) - _step)];
			};
			[] call ExileClient_gui_constructionMode_update;
			_stopPropagation = true;
		};
	};
	case 0xC7:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 0.5;
			if(_shiftState)then{_step = 1.5;};
			if(_controlState)then{_step = 0.1;};
			if(_altState)then{_step = 0.01;};
			if!(ExileClientConstructionMode isEqualTo 4)then
			{
				ExileClientConstructionOffset set [1, (((ExileClientConstructionOffset select 1) + _step) min 6) max ExileClientConstructionBoundingRadius ];
			}else{
				ExileClientConstructionOffset set [1,((ExileClientConstructionOffset select 1) + _step)];
			};
			[] call ExileClient_gui_constructionMode_update;
			_stopPropagation = true;
		};
	};
	case 0xCF:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 0.5;
			if(_shiftState)then{_step = 1.5;};
			if(_controlState)then{_step = 0.1;};
			if(_altState)then{_step = 0.01;};
			if!(ExileClientConstructionMode isEqualTo 4)then
			{
				ExileClientConstructionOffset set [1, (((ExileClientConstructionOffset select 1) - _step) min 6) max ExileClientConstructionBoundingRadius ];
			}else{
				ExileClientConstructionOffset set [1,((ExileClientConstructionOffset select 1) - _step)];
			};
			[] call ExileClient_gui_constructionMode_update;
			_stopPropagation = true;
		};
	};
	case 0x48:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 0.5;
			if(_shiftState)then{_step = 1.5;};
			if(_controlState)then{_step = 0.1;};
			if(_altState)then{_step = 0.01;};
			if!(ExileClientConstructionMode isEqualTo 4)then
			{
				ExileClientConstructionOffset set [1, (((ExileClientConstructionOffset select 1) + _step) min 6) max ExileClientConstructionBoundingRadius ];
			}else{
				ExileClientConstructionOffset set [1,((ExileClientConstructionOffset select 1) + _step)];
			};
			[] call ExileClient_gui_constructionMode_update;
			_stopPropagation = true;
		};
	};
	case 0x50:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 0.5;
			if(_shiftState)then{_step = 1.5;};
			if(_controlState)then{_step = 0.1;};
			if(_altState)then{_step = 0.01;};
			if!(ExileClientConstructionMode isEqualTo 4)then
			{
				ExileClientConstructionOffset set [1, (((ExileClientConstructionOffset select 1) - _step) min 6) max ExileClientConstructionBoundingRadius ];
			}else{
				ExileClientConstructionOffset set [1,((ExileClientConstructionOffset select 1) - _step)];
			};
			[] call ExileClient_gui_constructionMode_update;
			_stopPropagation = true;
		};
	};
	case 0x4B:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 0.5;
			if(_shiftState)then{_step = 1.5;};
			if(_controlState)then{_step = 0.1;};
			if(_altState)then{_step = 0.01;};
			if!(ExileClientConstructionMode isEqualTo 4)then
			{
				ExileClientConstructionOffset set [0,((((ExileClientConstructionOffset select 0) - _step)min 10) max -10)];
			}else{
				ExileClientConstructionOffset set [0,((ExileClientConstructionOffset select 0) - _step)];
			};
			[] call ExileClient_gui_constructionMode_update;
			_stopPropagation = true;
		};
	};
	case 0x4D:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 0.5;
			if(_shiftState)then{_step = 1.5;};
			if(_controlState)then{_step = 0.1;};
			if(_altState)then{_step = 0.01;};
			if!(ExileClientConstructionMode isEqualTo 4)then
			{
				ExileClientConstructionOffset set [0,((((ExileClientConstructionOffset select 0) + _step)min 10) max -10)];
			}else{
				ExileClientConstructionOffset set [0,((ExileClientConstructionOffset select 0) + _step)];
			};
			[] call ExileClient_gui_constructionMode_update;
			_stopPropagation = true;
		};
	};
	case 0x4C:
	{
		if (ExileClientIsInConstructionMode) then
		{
			BuildVecYaw = 0;BuildVecPitch = 0;BuildVecRoll = 0;
			ExileClientConstructionOffset = [0,5,0];
			_stopPropagation = true;
		};
	};
	case 0x52:
	{
		if (ExileClientIsInConstructionMode) then
		{
			if(DPBEAClientObjAttachedTo isEqualTo player)then
			{
				private _isClass = isClass(configFile >> "CfgVehicles" >> (typeOf ExileClientInteractionObject));
				private _returnItem = isText(configFile >> "CfgVehicles" >> (typeOf ExileClientInteractionObject) >> "returnItem");
				private _exileBuildable = (ExileClientInteractionObject isKindOf "Exile_Construction_Abstract_Static");
				if((_returnItem)||(_exileBuildable))then
				{
					[]spawn
					{
						disableSerialization;
						private _result = ["Do you really want to snap to this object?", "Confirm", "Yes", "Nah"] call BIS_fnc_guiMessage;
						waitUntil { !isNil "_result" };
						if (_result) then
						{
							BuildVecYaw = 0;BuildVecPitch = 0;BuildVecRoll = 0;
							DPBEAClientObjAttachedTo = ExileClientInteractionObject;
							ExileClientConstructionMode = 4;
						};
					};
				};
			}else{
				BuildVecYaw = 0;BuildVecPitch = 0;BuildVecRoll = 0;
				DPBEAClientObjAttachedTo = player;
				ExileClientConstructionMode = 1;
			};
			_stopPropagation = true;
		};
	};
	case 0xCB:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0xCD:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0xC8:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0xD0:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0xDB:
	{
		switch (ExilePartyEspMode) do 
		{
			case 0: 		{ ExilePartyEspMode = 1; };
			case 1: 	{ ExilePartyEspMode = 2; };
			case 2: 			{ ExilePartyEspMode = 0; };
		};
		_stopPropagation = true;
	};
};
_stopPropagation