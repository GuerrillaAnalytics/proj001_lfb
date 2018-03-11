drop table if exists proj001_lfb_0_1_0.l3_postcodes cascade;

create table proj001_lfb_0_1_0.l3_postcodes (
id			serial primary key
,postcode_full		text
,postcode_district	text
,incgeo_boroughname	text
,incgeo_wardname	text
,incgeo_wardnamenew	text
,frs			text
);


insert into proj001_lfb_0_1_0.l3_postcodes (
postcode_full	
,postcode_district	
,incgeo_boroughname	
,incgeo_wardname	
,incgeo_wardnamenew	
,frs
)
select distinct  
postcode_full
,postcode_district		
,incgeo_boroughname	
,incgeo_wardname	
,incgeo_wardnamenew	
,frs
from proj001_lfb_0_1_0.l2_incidents
order by 
postcode_full	
,postcode_district	
,incgeo_boroughname	
,incgeo_wardname	
,incgeo_wardnamenew
,frs
;
/*
select * from proj001_lfb_0_1_0.l3_postcodes limit 50

select * from proj001_lfb_0_1_0.l2_incidents limit 10
*/


