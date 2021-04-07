private["_worldName"];
 _worldName = tolower(worldName);
 ["SETTING UP MAP: tem_summaw"] call ALiVE_fnc_dump;
 ALIVE_Indexing_Blacklist = [];
 ALIVE_airBuildingTypes = [];
 ALIVE_militaryParkingBuildingTypes = [];
 ALIVE_militarySupplyBuildingTypes = [];
 ALIVE_militaryHQBuildingTypes = [];
 ALIVE_militaryAirBuildingTypes = [];
 ALIVE_civilianAirBuildingTypes = [];
 ALiVE_HeliBuildingTypes = [];
 ALIVE_militaryHeliBuildingTypes = [];
 ALIVE_civilianHeliBuildingTypes = [];
 ALIVE_militaryBuildingTypes = [];
 ALIVE_civilianPopulationBuildingTypes = [];
 ALIVE_civilianHQBuildingTypes = [];
 ALIVE_civilianPowerBuildingTypes = [];
 ALIVE_civilianCommsBuildingTypes = [];
 ALIVE_civilianMarineBuildingTypes = [];
 ALIVE_civilianRailBuildingTypes = [];
 ALIVE_civilianFuelBuildingTypes = [];
 ALIVE_civilianConstructionBuildingTypes = [];
 ALIVE_civilianSettlementBuildingTypes = [];
 if(tolower(_worldName) == "tem_summaw") then {
ALIVE_Indexing_Blacklist = ALIVE_Indexing_Blacklist + ["ww2\objects_m\structures\if_buildingswinter_m\ww2_sarai_mid_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_sarai_big_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_sarai_big_destroyed_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_sarai_big_damage_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_kladovka_1_w.p3d","ca\buildings2\shed_small\shed_w01.p3d","ww2\objects_m\structures\if_buildings2winter_m\ww2_dlc1_kirpich_1floor_damaged_w.p3d","ww2\objects_m\structures\if_buildingsrwwinter_m\ww2_shed_w01_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_dom_pol_damage_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_well_w.p3d","ca\buildings2\houseruins\r_shed_ind02.p3d","ca\buildings2\shed_small\shed_m03.p3d","ca\buildings2\misc_waterstation\misc_waterstation.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_dom_pl_sml_damage_w.p3d","ca\structures_e\misc\shed_m01_ep1.p3d","ca\structures\nav_boathouse\nav_boathouse_piert.p3d"];
ALIVE_militaryBuildingTypes = ALIVE_militaryBuildingTypes + ["ww2\objects_m\structures\i44_objects_bunker_m\i44_bunker_r67_right.p3d","ww2\objects_m\structures\if_buildings2_m\ww2_bunker_mg.p3d","ww2\objects_m\structures\i44_objects_bunker_m\i44_bunker_r67_left.p3d"];
ALIVE_militaryParkingBuildingTypes = ALIVE_militaryParkingBuildingTypes + ["ww2\objects_m\structures\i44_objects_bunker_m\i44_bunker_r67_right.p3d","ww2\objects_m\structures\if_buildings2_m\ww2_bunker_mg.p3d","ww2\objects_m\structures\i44_objects_bunker_m\i44_bunker_r67_left.p3d"];
ALIVE_militarySupplyBuildingTypes = ALIVE_militarySupplyBuildingTypes + ["ww2\objects_m\structures\i44_objects_bunker_m\i44_bunker_r67_right.p3d","ww2\objects_m\structures\if_buildings2_m\ww2_bunker_mg.p3d","ww2\objects_m\structures\i44_objects_bunker_m\i44_bunker_r67_left.p3d"];
ALIVE_civilianPopulationBuildingTypes = ALIVE_civilianPopulationBuildingTypes + ["ww2\objects_m\structures\if_buildingswinter_m\ww2_chik_house2_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_dom_pl_big2_damage_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_hata_2_dam_w.p3d","ww2\objects_m\structures\if_buildingsrwwinter_m\ww2_shed_w03_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_city1e_1_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_countryside_house_2_damaged_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_town_house_1_w.p3d","ww2\objects_m\structures\if_buildingsrwwinter_m\ww2_shed_w02_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_small_1_w.p3d","ca\buildings2\shed_small\shed_w02.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_cr_mid_damaged_w.p3d","ww2\objects_m\structures\if_buildings2winter_m\ww2_dlc1_house_1floor_pol_w.p3d","ca\structures\shed\shed_small\shed_w4.p3d","ww2\objects_m\structures\if_buildingsrwwinter_m\ww2_shed_m01_w.p3d","ww2\objects_m\structures\if_buildings2winter_m\ww2_french_stone_house_dam_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_kladovka2_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_countryside_house_1_damaged_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_city_shop_1e_damaged_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_kirpich_1floor_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_city1e_2_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_hata_1_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_1floor_pol_damaged_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_city1e_1_damaged_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_dom_pl_big_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_2e_1_damaged_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_countryside_house_2_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_sarai_big_dam_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_dom_pl_big_damage_w.p3d"];
ALIVE_civilianHQBuildingTypes = ALIVE_civilianHQBuildingTypes + ["ww2\objects_m\structures\if_buildingswinter_m\ww2_chik_house2_w.p3d","ww2\objects_m\structures\if_buildingsrwwinter_m\ww2_shed_w03_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_city1e_1_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_town_house_1_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_small_1_w.p3d","ww2\objects_m\structures\if_buildings2winter_m\ww2_dlc1_house_1floor_pol_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_kladovka2_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_kirpich_1floor_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_city1e_2_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_hata_1_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_dom_pl_big_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_countryside_house_2_w.p3d"];
ALIVE_civilianSettlementBuildingTypes = ALIVE_civilianSettlementBuildingTypes + ["ww2\objects_m\structures\if_buildingswinter_m\ww2_chik_house2_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_dom_pl_big2_damage_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_hata_2_dam_w.p3d","ww2\objects_m\structures\if_buildingsrwwinter_m\ww2_shed_w03_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_city1e_1_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_countryside_house_2_damaged_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_town_house_1_w.p3d","ww2\objects_m\structures\if_buildingsrwwinter_m\ww2_shed_w02_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_small_1_w.p3d","ca\buildings2\shed_small\shed_w02.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_cr_mid_damaged_w.p3d","ww2\objects_m\structures\if_buildings2winter_m\ww2_dlc1_house_1floor_pol_w.p3d","ca\structures\shed\shed_small\shed_w4.p3d","ww2\objects_m\structures\if_buildingsrwwinter_m\ww2_shed_m01_w.p3d","ww2\objects_m\structures\if_buildings2winter_m\ww2_french_stone_house_dam_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_kladovka2_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_countryside_house_1_damaged_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_city_shop_1e_damaged_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_kirpich_1floor_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_city1e_2_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_hata_1_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_1floor_pol_damaged_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_city1e_1_damaged_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_dom_pl_big_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_house_2e_1_damaged_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_countryside_house_2_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_sarai_big_dam_w.p3d","ww2\objects_m\structures\if_buildingswinter_m\ww2_dom_pl_big_damage_w.p3d"];
};