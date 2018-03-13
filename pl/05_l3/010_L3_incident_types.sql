/*
select * from proj001_lfb_1_0_0.l2_incidents limit 100

*/

drop table if exists proj001_lfb_1_0_0.l3_incident_types cascade;

create table proj001_lfb_1_0_0.l3_incident_types (
id			serial primary key
,incidentgroup		text not null
,stopcodedescription	text not null
,specialservicetype	text 
);


insert into proj001_lfb_1_0_0.l3_incident_types (incidentgroup,stopcodedescription,specialservicetype)
select distinct  incidentgroup
,stopcodedescription
,case when specialservicetype = '' then null else specialservicetype end as specialservicetype
from proj001_lfb_1_0_0.l2_incidents
order by incidentgroup,stopcodedescription,specialservicetype;

/*
select * from proj001_lfb_1_0_0.l3_incident_types 

*/