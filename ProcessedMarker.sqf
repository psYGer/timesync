_transporterClass = "B_Truck_01_transport_F";
_factoryClass = "Land_MapBoard_F";

YG_TransporterList = [];
YG_FactoryList = [];
YG_SpawnList = [];

{
  if (["YG_Transporter_",_x] call BIS_fnc_inString) then {
    _transporter = _transporterClass createVehicle [0,0,1000];
    _transporter setDir markerDir _x;
    _transporter setPos [markerPos _x select 0,markerPos _x select 1,3.5];
    _transporter lockDriver true;
    _transporter lockCargo [0, true];
    _name = [_x, 15] call BIS_fnc_trimString;
    _transporter setVariable ["YG_Name", _name, true];
    YG_TransporterList = YG_TransporterList + [_transporter];
  };
  if (["YG_Factory_",_x] call BIS_fnc_inString) then {
    _name = [_x, 11] call BIS_fnc_trimString;
    _factory = _factoryClass createVehicle [0,0,1000];
    _factory setDir markerDir _x;
    _factory setPos [markerPos _x select 0,markerPos _x select 1,3.5];
    _factory setVariable ["YG_Name", _name, true];
    YG_FactoryList = YG_FactoryList + [_factory];
  };
  if ((["YG_Spawn_",_x] call BIS_fnc_inString)) then {
    YG_SpawnList = YG_SpawnList + [_x];
  };
} forEach allMapMarkers;

{publicVariable _x} forEach ["YG_TransporterList","YG_FactoryList","YG_SpawnList"];

waitUntil {time > 5};
{_x enableSimulation false} forEach (YG_FactoryList);