/**
 * ExileClient_gui_hud_event_onKeyDown
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_stopPropagation","_caller","_keyCode","_shiftState","_controlState","_altState","_grenadeName"];
_stopPropagation = false;
_caller = _this select 0;
_keyCode = _this select 1;
_shiftState = _this select 2;
_controlState = _this select 3;
_altState = _this select 4; 
if ((_keyCode in (actionKeys "nightVision")) && ExileClientGasMaskVisible) exitWith {true};
if (_keyCode in (actionKeys "TacticalView")) exitWith {true};
if (!(_controlState) && (_keyCode in (actionKeys "Throw"))) exitWith
{	
	_stopPropagation = false;
	_grenadeName = (currentThrowable player) select 0;
	if (_grenadeName isEqualTo "Exile_Item_ZipTie") then 
	{
		call ExileClient_object_handcuffs_use;
		_stopPropagation = true;
	};
	_stopPropagation
};
switch (_keyCode) do  
{ 
	case 0x29:	{ _stopPropagation = true; }; 
	case 0x0B:	{ _stopPropagation = true; };
	case 0x06: 	{ _stopPropagation = true; };
	case 0x07: 	{ _stopPropagation = true; };
	case 0x08: 	{ _stopPropagation = true; };
	case 0x09: 	{ _stopPropagation = true; };
	case 0x0A: 	{ _stopPropagation = true; };
	case 0x3B: 	{ _stopPropagation = true; };
	case 0x3C: 	{ _stopPropagation = true; };
	case 0x3D:	{ _stopPropagation = true; };
	case 0x3E:	{ _stopPropagation = true; };
	case 0x3F:	{ _stopPropagation = true; };
	case 0x40: 	{ _stopPropagation = true; };
	case 0x41: 	{ _stopPropagation = true; };
	case 0x42:	{ _stopPropagation = true; };
	case 0x43: 	{ _stopPropagation = true; };
	case 0x44:	{ _stopPropagation = true; };
	case 0x57: 	{ _stopPropagation = true; };
	case 0x58: 	{ _stopPropagation = true; };
	case 0x0E: 	{ _stopPropagation = true; };
	case 0x02: 	
	{ 
		_stopPropagation = true; 
	};
	case 0x03: 	
	{ 
		_stopPropagation = true; 
	};
	case 0x04: 	
	{ 
		_stopPropagation = true; 
	};
	case 0x05: 	
	{ 
		_stopPropagation = true;
	};
	case 0xD2:
	{
		_stopPropagation = true;
	};
	case 0x10:
	{
		if (ExileClientIsInConstructionMode) then
		{
			if!(ExileClientConstructionMode isEqualTo 3)then
			{
				_step = 1;
				if(_shiftState)then{_step = 3;};
				if(_controlState)then{_step = 0.5;};
				if(_altState)then{	_step = 0.25;};
				BuildVecYaw = (((BuildVecYaw - _step)min 360) max -360);	
				[] call ExileClient_gui_constructionMode_update;
				_stopPropagation = true;
			}
			else
			{
				_step = 45;
				if (_shiftState) then 
				{
					_step = 90;
				}
				else 
				{
					if (_controlState) then
					{
						_step = 22.5;
					};
				};
				ExileClientConstructionRotation = (ExileClientConstructionRotation - _step + 360) % 360;	
				[] call ExileClient_gui_constructionMode_update;
				_stopPropagation = true;
			};
		};
	};
	case 0x12:
	{
		if (ExileClientIsInConstructionMode) then
		{
			if!(ExileClientConstructionMode isEqualTo 3)then
			{
				_step = 1;
				if(_shiftState)then{_step = 3;};
				if(_controlState)then{_step = 0.5;};
				if(_altState)then{	_step = 0.25;};
				BuildVecYaw = (((BuildVecYaw + _step)min 360) max -360);	
				[] call ExileClient_gui_constructionMode_update;
				_stopPropagation = true;
			}
			else
			{
				_step = 45;
				if (_shiftState) then 
				{
					_step = 90;
				}
				else 
				{
					if (_controlState) then
					{
						_step = 22.5;
					};
				};
				ExileClientConstructionRotation = (ExileClientConstructionRotation + _step + 360) % 360;	
				[] call ExileClient_gui_constructionMode_update;
				_stopPropagation = true;
			};
		};
	};
	case 0x47:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 1;
			if(_shiftState)then{_step = 3;};
			if(_controlState)then{_step = 0.5;};
			if(_altState)then{	_step = 0.25;};
			BuildVecYaw = (((BuildVecYaw - _step)min 360) max -360);	
			[] call ExileClient_gui_constructionMode_update;
			_stopPropagation = true;
		};
	};
	case 0x49:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 1;
			if(_shiftState)then{_step = 3;};
			if(_controlState)then{_step = 0.5;};
			if(_altState)then{	_step = 0.25;};
			BuildVecYaw = (((BuildVecYaw + _step)min 360) max -360);	
			[] call ExileClient_gui_constructionMode_update;
			_stopPropagation = true;
		};
	};
	case 0xC9: 
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0xD1: 
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x39:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0xCF:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x48:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x50:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x4B:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x4D:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x4C:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x52:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0xC7:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0xCB:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 0.5;
			if(_shiftState)then{_step = 1.5;};
			if(_controlState)then{_step = 0.1;};
			if(_altState)then{_step = 0.01;};
			BuildVecRoll = (((BuildVecRoll - _step)min 360) max -360);
			_stopPropagation = true;
		};
	};
	case 0xCD:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 0.5;
			if(_shiftState)then{_step = 1.5;};
			if(_controlState)then{_step = 0.1;};
			if(_altState)then{_step = 0.01;};
			BuildVecRoll = (((BuildVecRoll + _step)min 360) max -360);
			_stopPropagation = true;
		};
	};
	case 0xC8:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 0.5;
			if(_shiftState)then{_step = 1.5;};
			if(_controlState)then{_step = 0.1;};
			if(_altState)then{_step = 0.01;};
			BuildVecPitch =(((BuildVecPitch - _step)min 360) max -360);
			_stopPropagation = true;
		};
	};
	case 0xD0:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_step = 0.5;
			if(_shiftState)then{_step = 1.5;};
			if(_controlState)then{_step = 0.1;};
			if(_altState)then{_step = 0.01;};
			BuildVecPitch = (((BuildVecPitch + _step)min 360) max -360);
			_stopPropagation = true;
		};
	};
	case 0x01:
	{
		if (ExileClientIsInConstructionMode) then
		{
			ExileClientConstructionResult = 2;
			_stopPropagation = true;
		};
		if (ExileIsPlayingRussianRoulette) then 
		{
			if (ExileRussianRouletteCanEscape) then 
			{
				["leaveRussianRouletteRequest", []] call ExileClient_system_network_send;
				ExileRussianRouletteCanEscape = false;
			};
			_stopPropagation = true;
		};
	};
};
_stopPropagation