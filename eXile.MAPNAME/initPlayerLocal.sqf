if (!hasInterface || isServer) exitWith {};

missionNamespace setVariable ["freeVectorBuilding",(compileFinal preprocessFile "eXpochVectorBldg\eXpochClient_FREE_vectorbuilding.sqf")];