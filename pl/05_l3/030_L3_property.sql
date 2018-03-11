drop table if exists proj001_lfb_0_1_0.l3_property cascade;

create table proj001_lfb_0_1_0.l3_property (
id			serial primary key
,propertycategory	text
,propertytype		text
);


insert into proj001_lfb_0_1_0.l3_property (
propertycategory		
,propertytype		
)
select distinct  
propertycategory		
,propertytype		
from proj001_lfb_0_1_0.l2_incidents
order by 
propertycategory		
,propertytype	
;

/*
select * from proj001_lfb_0_1_0.l3_property 

select * from proj001_lfb_0_1_0.l2_incidents limit 10
*/


