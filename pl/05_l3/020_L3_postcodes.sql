drop table if exists proj001_lfb_0_0_1.l3_postcodes cascade;

create table proj001_lfb_0_0_1.l3_postcodes (
id			serial primary key
,postcode_full		text
,incgeo_boroughname	text
,incgeo_wardname	text
,incgeo_wardnamenew	text
);


insert into proj001_lfb_0_0_1.l3_postcodes (
postcode_full		
,incgeo_boroughname	
,incgeo_wardname	
,incgeo_wardnamenew	
)
select distinct  
postcode_full		
,incgeo_boroughname	
,incgeo_wardname	
,incgeo_wardnamenew	
from proj001_lfb_0_0_1.l2_incidents
order by 
postcode_full		
,incgeo_boroughname	
,incgeo_wardname	
,incgeo_wardnamenew;


/*
select * from proj001_lfb_0_0_1.l3_postcodes 

*/


