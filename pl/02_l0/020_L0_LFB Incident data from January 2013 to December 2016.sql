create schema if not exists inputs;

DROP TABLE IF EXISTS inputs.inp_002_02_LFB_Incident_data_from_January_2013_to_December_2016 cascade;

CREATE TABLE inputs.inp_002_02_LFB_Incident_data_from_January_2013_to_December_2016 (
IncidentNumber				text
,DateOfCall				text
,CalYear				text
,TimeOfCall				text
,HourOfCall				text
,IncidentGroup				text
,StopCodeDescription			text
,SpecialServiceType			text
,PropertyCategory			text
,PropertyType				text
,AddressQualifier			text
,Postcode_full				text
,Postcode_district			text
,IncGeo_BoroughCode			text
,IncGeo_BoroughName			text
,ProperCase				text
,IncGeo_WardCode			text
,IncGeo_WardName			text
,IncGeo_WardNameNew			text
,Easting_m				text
,Northing_m				text
,Easting_rounded			text
,Northing_rounded			text
,FRS					text
,IncidentStationGround			text
,FirstPumpArriving_AttendanceTime	text
,FirstPumpArriving_DeployedFromStation	text
,SecondPumpArriving_AttendanceTime	text
,SecondPumpArriving_DeployedFromStation	text
,NumStationsWithPumpsAttending		text
,NumPumpsAttending			text
);

/*
select * from inputs.inp_002_02_LFB_Incident_data_from_January_2013_to_December_2016 limit 10

*/
