/*
* Filename:
* init.sqf
* Description:
* Executed when mission is started (before briefing screen)
*
* Creation date: 05/04/2021
*
* */
// ====================================================================================

//Starting Init
["| OP DIAMOND HANDS - Executing init.sqf..."] call ALiVE_fnc_dump;

[] call vn_ms_fnc_enableSOGTraits;


ALiVE_fnc_tasks_dh = {

    private _task1t = "Find/Clear Bunker 1";
    private _task1d = "Patrol west to Ket Thuc, secure the village, find the underground bunker and clear it of all enemies. Collect intelligence and write up intel on the map.";
    private _task1w = "tunnel_1";
    private _task1 = [true, "T1", [_task1d, _task1t, _task1w], _task1w, true] call BIS_fnc_taskCreate;

    private _task2t = "Find/Clear Bunker 2";
    private _task2d = "Another tunnel system lies further west. Secure the village of Vong Xo, again find the hidden bunker entrance and clear the bunker.";
    private _task2w = "tunnel_2";
    private _task2 = [true, "T2", [_task2d, _task2t, _task2w], _task2w, true] call BIS_fnc_taskCreate;

    private _task3t = "Find/Clear Bunker 3";
    private _task3d = "To the south and across the river lies the village of Dao Trai. Use boats to cross the river and secure the village. Clear the suspected underground bunker.";
    private _task3w = "tunnel_3";
    private _task3 = [true, "T3", [_task3d, _task3t, _task3w], _task3w, true] call BIS_fnc_taskCreate;

    private _task4t = "Escape and Evade";
    private _task4d = "HQ can't provide helicopter extraction until you are at RV Bowra. Use boats and take the river east. ";
    private _task4w = "bowra";
    private _task4 = [true, "T4", [_task4d, _task4t, _task4w], _task4w, true] call BIS_fnc_taskCreate;

    private _task5t = "Return To Base";
    private _task5d = "Call in a helicopter to extract you back to Pleiku Airbase.";
    private _task5w = "marker_4";
    private _task5 = [true, "T5", [_task5d, _task5t, _task5w], _task5w, true] call BIS_fnc_taskCreate;


    "T1" call BIS_fnc_taskSetCurrent;
};

ALiVE_fnc_vn_enableAutoTasks = {

    ALIVE_autoGeneratedTasks = ["Rescue","CSAR"];

    private _taskData = [];
        _taskData set [0,"BLUFOR_TASK1"];
        _taskData set [1,"1"];
        _taskData set [2,"WEST"];
        _taskData set [3,"B_MACV"];
        _taskData set [4,"O_VC"];
        _taskData set [5,"Constant"];

    [ALIVE_taskHandler, "autoGenerateTasks", _taskData] call ALIVE_fnc_taskHandler;

    ALIVE_autoGeneratedTasks = ["Assassination","DestroyInfantry","SabotageBuilding","InsurgencyPatrol","InsurgencyDestroyAssets","Rescue","CSAR","DestroyInfantry","SabotageBuilding","InsurgencyPatrol","InsurgencyDestroyAssets","DestroyInfantry","SabotageBuilding","InsurgencyPatrol","InsurgencyDestroyAssets"];
};

ALiVE_fnc_vn_placeTunnel = {

    private _position = _this select 0;
    private _tunneltype = _this select 1;
    private _classname = _this select 2; //pavn_vc_local,pavn_vc_regional, pavn_vc_main
    private _size = if(count _this > 3) then {_this select 3} else {3};

    private _classes = call compile getText(configfile >> "CfgVehicles" >> "vn_module_tunnel_init" >> "Attributes" >> "garrison_classnames_preselection" >> "values" >> _classname >> "value");

    // create logic
    private _moduleGroup = createGroup sideLogic;

    _position = [_position, 5, 25, 1, 0, 0.5, 0] call BIS_fnc_findSafePos;

    private _tunnel = "vn_module_tunnel_init" createUnit [
        _position,
        _moduleGroup,
        format["this setVariable ['tunnel_position', %1, true]; this setVariable ['garrison_classnames_preselection', %2, true]; this setVariable ['garrison_side', 1, true]; this setVariable ['garrison_size', %3, true];  this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true];", _tunneltype, _classes, _size]
    ];

    ["Placing tunnel entrance for tunnel %1 at %2, enemy are %3 man %4 group", _tunneltype, _position, _size * 10, _classname] call ALiVE_fnc_dump;

    // lower the tunnel entrance a little
    [_position] spawn
    {

        params["_position"];

        private _object = objNull;

        waitUntil { _object = _position nearestObject "Land_vn_o_trapdoor_01"; !isNull _object};

        private _heightAdjust = random [0.2, 0.4, 0.5];
        _object setpos [position _object select 0, position _object select 1, (position _object select 2) - _heightAdjust];
    };
};

ALiVE_fnc_vn_dh_ending = {

        vehicle player addAction
        [
            "Turn Off Music",    // title
            {
                params ["_target", "_caller", "_actionId", "_arguments"];
                playMusic "";
                0 fadesound 1; // script
            },
            nil,        // arguments
            1.5,        // priority
            false,       // showWindow
            true,       // hideOnUse
            "",         // shortcut
            "true",     // condition
            5,         // radius
            false,      // unconscious
            "",         // selection
            ""          // memoryPoint
        ];

        [] spawn {
            0 fadesound 0.5;

            playMusic "Adagio";

            sleep 20;

            titleText ["<t shadow = '1' size = '2' font='tt2020style_e_vn_bold'>In memory of the MACV-SOG warriors that never returned home.</t>", "PLAIN",1.5,true,true];

            sleep 15;

            titleText ["<t shadow = '1' size = '2' font='tt2020style_e_vn_bold'>And in recognition of those warriors that lived to tell the tale.</t>", "PLAIN",1.5,true,true];

            sleep 15;

            titleText ["<t shadow = '1' size = '2' font='tt2020style_e_vn_bold'>With thanks to Savage Game Design and Bohemia Interactive.</t>", "PLAIN",1.5,true,true];

            sleep 15;

            titleText ["<t shadow = '1' size = '2' font='tt2020style_e_vn_bold'><br/>ALiVE Developers<br/><br/>Tupolov, Highhead, Arjay,<br/>Friznit, SpyderBlack, Jman,<br/>MarcelDev, AUTigerGrad, Wolffy</t>", "PLAIN",1.5,true,true];
        };
};

if (isServer) then {

};

if (hasInterface) then {

    ["| OP DIAMOND HANDS - Running ClientInit..."] call ALiVE_fnc_dump;

    [] spawn {

        // move JIP player to Outpost Meyer
        if (didJIP) then {
            player setpos (getMarkerPos "respawn_west");
        };

        //  enableRadio false;
        titleText ["\n\n\nThe ALiVE Team presents...", "BLACK IN",9999];
        0 fadesound 0;

        if (!didJIP) then {

            sleep 3;

            playMusic "Fortunate_Son";

            vehicle player addAction
            [
                "Turn Off Music",    // title
                {
                    params ["_target", "_caller", "_actionId", "_arguments"];
                    playMusic "";
                    0 fadesound 1; // script
                },
                nil,        // arguments
                1.5,        // priority
                false,       // showWindow
                true,       // hideOnUse
                "",         // shortcut
                "true",     // condition
                5,         // radius
                false,      // unconscious
                "",         // selection
                ""          // memoryPoint
            ];

            private ["_cam","_camx","_camy","_camz","_object"];
            _start = time;

            //waituntil {(player getvariable ["alive_sys_player_playerloaded",false]) || ((time - _start) > 10)};
            sleep 2;

        };

        _cam = [player , false, "HIGH"] call ALIVE_fnc_addCamera;

        _cam CameraEffect ["Internal","Back"];
        _cam CamCommit 10;

        titleText ["\n\n\nA L i V E   |   D I A M O N D  H A N D S", "BLACK IN",10];

        10 fadesound 0.9;

        [_cam, (vehicle player),10,false,200,120,350] call ALIVE_fnc_establishShot;

        sleep 10;

		[] spawn {
		    sleep 2;
		    // Corner coordinates
            private _w = 0.95;
            private _h = 0.55;
		    date params ["", "", "", "_hour", "_minute"];

		    [
		        [
		            ["Operation: ", "<t align = 'left' shadow = '1' size = '1.0' font='tt2020style_e_vn_bold'>%1</t>"],
		            ["<t size = '1.0'>Diamond Hands</t>"],
		            [format ["<t size = '1.0'>Tuesday 6th May 1969. %1%2%3%4h</t>", ["0", ""] select (_hour >= 10), _hour, ["0", ""] select (_minute >= 10), _minute]],
		            ["RT Idaho, MACV-SOG, 5th SF Group,", "<t align = 'left' shadow = '1' size = '1.0'>%1</t><br/>"],
                ["South Vietnam.", "<t align = 'left' shadow = '1' size = '1.0' font='tt2020style_e_vn_bold'>%1</t><br/><br/>"],
		            ["Mission: ", "<t align = 'left' shadow = '1' size = '1.0' font='tt2020style_e_vn_bold'>%1</t>"],
		            ["<t size = '1.0'>Search and destroy enemy tunnel systems and collect intelligence.</t>", nil, 3.5]
		        ],
		        [safeZoneX + safeZoneW - _w, _w],
		        [safeZoneY + safeZoneH - _h - 0.05, _h]
		    ] spawn vn_ms_fnc_sfx_typeText;
		};

        if (!didJIP) then {

             sleep 5;

            [_cam, (vehicle player),5,false,65,40,350] call ALIVE_fnc_establishShot;

            sleep 5;

            [_cam, (vehicle player),4,false] call ALIVE_fnc_zoomShot;

            sleep 4;

            [_cam, (vehicle player),4,false] call ALIVE_fnc_followShot;

            sleep 4;

            [_cam, (vehicle player),5,false,12] call ALIVE_fnc_chaseSideShot;

            sleep 5;

            _cam camSetTarget (driver choppah);

            _cam cameraEffect ["internal", "BACK"];

            _cam camCommit 0;

            _cam attachTo [vehicle player,[0,1,-1.3]];

            sleep 7;

        };

        _cam CameraEffect ["Terminate","Back"];
        CamDestroy _cam;

        sleep 15;

        _title = "<t size='1.5' color='#68a7b7' shadow='1'>DIAMOND HANDS</t><br/>";
        _text = format["%1<t>A joint MACV-SOG Recon Team and US Army Tunnel Rats are on their way to Outpost Meyer.</t>",_title];

        ["openSideSmall",0.4] call ALIVE_fnc_displayMenu;
        ["setSideSmallText",_text] call ALIVE_fnc_displayMenu;

        sleep 15;

        _title = "<t size='1.5' color='#68a7b7' shadow='1'>DIAMOND HANDS</t><br/>";
        _text = format["%1<t>Once you land, grab kit and equipment from Outpost Meyer. Grab a PRC-77 if you are the RTO.</t>",_title];

        ["openSideSmall",0.4] call ALIVE_fnc_displayMenu;
        ["setSideSmallText",_text] call ALIVE_fnc_displayMenu;


        sleep 15;

        _title = "<t size='1.5' color='#68a7b7' shadow='1'>DIAMOND HANDS</t><br/>";
        _text = format["%1<t>Outpost Meyer is located near the LZ, this is a secure area with no threat from enemy.</t>",_title];

        ["openSideSmall",0.4] call ALIVE_fnc_displayMenu;
        ["setSideSmallText",_text] call ALIVE_fnc_displayMenu;

        sleep 15;

        _title = "<t size='1.5' color='#68a7b7' shadow='1'>DIAMOND HANDS</t><br/>";
        _text = format["%1<t>Patrol west, search and eliminate forces at the three key suspected tunnel systems.</t>",_title];

        ["openSideSmall",0.4] call ALIVE_fnc_displayMenu;
        ["setSideSmallText",_text] call ALIVE_fnc_displayMenu;

        sleep 15;

        _title = "<t size='1.5' color='#68a7b7' shadow='1'>DIAMOND HANDS</t><br/>";
        _text = format["%1<t>Escape and evade, using civilian or enemy vehicles, back to RV point Bowra, before requesting extraction..</t>",_title];

        ["openSideSmall",0.4] call ALIVE_fnc_displayMenu;
        ["setSideSmallText",_text] call ALIVE_fnc_displayMenu;

        sleep 15;

        _title = "<t size='1.5' color='#68a7b7' shadow='1'>DIAMOND HANDS</t><br/>";
        _text = format["%1<t>The Duty Officer at Outpost Meyer can despatch you directly to your squad after respawn.</t>",_title];

        ["openSideSmall",0.4] call ALIVE_fnc_displayMenu;
        ["setSideSmallText",_text] call ALIVE_fnc_displayMenu;

    };
};


