drop table if exists proj001_lfb_0_1_0.l3_incidents; 

create table proj001_lfb_0_1_0.l3_incidents (
id				serial primary key
,incidentnumber_cln		text
,dateofcall_cln			timestamp
,id_incident_type		integer
,id_property			integer
,id_postcode			integer
,incident_station_ground		text
,num_stations_with_pumps_attending	text
,num_pumps_attending			text
);


insert into proj001_lfb_0_1_0.l3_incidents (
incidentnumber_cln		
,dateofcall_cln			
,id_incident_type		
,id_property			
,id_postcode			
,incident_station_ground		
,num_stations_with_pumps_attending	
,num_pumps_attending			
)
select  
incidents.incidentnumber_cln
,dateofcall_cln
,incident_types.id
,properties.id
,pcode.id
,incidentstationground 
,numstationswithpumpsattending	
,numpumpsattending
from 
(
	select * from proj001_lfb_0_1_0.L2_incidents 
) incidents
left join
(
	select * from proj001_lfb_0_1_0.L3_incident_types	--37
)	incident_types
on	incidents.incidentgroup		=	incident_types.incidentgroup
and	incidents.stopcodedescription	=	incident_types.stopcodedescription
and 	coalesce(incidents.specialservicetype,'')	=	coalesce(incident_types.specialservicetype,'')
left join
(
	select * from proj001_lfb_0_1_0.L3_property
)	properties
on	coalesce(incidents.propertycategory,'')	=	coalesce(properties.propertycategory,'')
and	coalesce(incidents.propertytype,'')	=	coalesce(properties.propertytype,'')
left join
(
	select * from proj001_lfb_0_1_0.L3_postcodes 
) pcode
on	coalesce(incidents.postcode_full,'')	=	coalesce(pcode.postcode_full,'')
and 	coalesce(incidents.postcode_district,'')	=	coalesce(pcode.postcode_district,'')
and 	coalesce(incidents.incgeo_boroughname,'')	=	coalesce(pcode.incgeo_boroughname,'')
and 	coalesce(incidents.incgeo_wardname,'')	=	coalesce(pcode.incgeo_wardname,'')
and 	coalesce(incidents.incgeo_wardnamenew,'')	=	coalesce(pcode.incgeo_wardnamenew,'')
and 	coalesce(incidents.frs,'')	=	coalesce(pcode.frs,'')

/*
select * from proj001_lfb_0_1_0.l3_incidents

select * from proj001_lfb_0_1_0.L2_incidents  limit 5

select count(*) from proj001_lfb_0_1_0.L2_incidents 
485065

*/