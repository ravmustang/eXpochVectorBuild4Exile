/**
 * ExileClient_gui_constructionMode_update
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private["_display","_title","_titleControl","_description","_descriptionBackground"];
disableSerialization;
_display = uiNamespace getVariable "RscExileConstructionMode";
if (!isNull _display) then
{
	_title = "";
	switch (ExileClientConstructionMode) do
	{
		case 1: { _title = "FREE VECTOR MODE"; };
		case 2: { _title = "GRID MODE"; };
		case 3: { _title = "SNAP MODE"; };
		case 4: { _title = "OBJECT SNAP MODE"; };
	};
	if (ExileClientConstructionModePhysx) then
	{
		_title = _title + " + PHYSICS";
	};
	_titleControl = _display displayCtrl 1000;
	_titleControl ctrlSetText _title;
	_description = _display displayCtrl 1001;
	_description ctrlShow ExileClientConstructionShowHint;
	_descriptionBackground = _display displayCtrl 1002;
	_descriptionBackground ctrlShow ExileClientConstructionShowHint;
	_pos = ctrlPosition _descriptionBackground; 
	_descriptionBackground ctrlSetPosition [_pos select 0,_pos select 1,_pos select 2,450 * pixelH]; 
	_descriptionBackground ctrlCommit 0; 
	_description ctrlSetStructuredText parseText Format["<t align='left'>Free Vector Mode</t><t align='right' color='#3fd4fc'>1</t><br/> <t align='left'>Grid Mode</t><t align='right' color='#3fd4fc'>2</t><br/><t align='left'>Snap Mode</t><t align='right' color='#3fd4fc'>3</t><br/><t align='left'>Toggle Physics</t><t align='right' color='#3fd4fc'>4</t><br/><t color='#3fd4fc' align='center'>ORIGINAL</t><br/><t align='left'>Rotation</t><t align='right' color='#3fd4fc'>Q/E</t><br/><t align='left'>Elevation</t><t align='right' color='#3fd4fc'>PAGE UP/DOWN</t><br/><t align='left'>Distance</t><t align='right' color='#3fd4fc'>HOME/END</t><br/><t color='#33FF11' align='center'>DP CUSTOM</t><br/><t align='left'>Tilt and Pitch</t><t align='right' color='#3fd4fc'>Arrow Keys</t><br/><t align='left'>Rotate/Yaw</t><t align='right' color='#3fd4fc'>NUM7/NUM9</t><br/><t align='left'>Move Away/Back</t><t align='right' color='#3fd4fc'>NUM8/NUM2</t><br/><t align='left'>Move Left/Right</t><t align='right' color='#3fd4fc'>NUM4/NUM6</t><br/><t align='left'>Reset Object</t><t align='right' color='#3fd4fc'>NUM5</t><br/><t align='left'>Object Snapping</t><t align='right' color='#3fd4fc'>NUM0</t><br/><t color='#33FF11' align='center'>CUSTOM STEPPING</t><br/><t align='left'>Larger</t><t align='right' color='#3fd4fc'>SHIFT</t><br/><t align='left'>Smaller</t><t align='right' color='#3fd4fc'>CONTROL</t><br/><t align='left'>Precision</t><t align='right' color='#3fd4fc'>ALT</t><br/><t color='#33FF11' align='center'>FINISH UP</t><br/><t align='left'>Place</t><t align='right' color='#3fd4fc'>SPACE</t><br/><t align='left'>Abort</t><t align='right' color='#3fd4fc'>ESCAPE</t>"];
};
true