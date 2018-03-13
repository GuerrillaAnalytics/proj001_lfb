
/*Union together all incident files and clean with
one set of rules*/
drop table if exists proj001_lfb_1_0_0.L2_incidents;

create table proj001_lfb_1_0_0.L2_incidents as
select 
incidentnumber as incidentnumber_cln
,to_timestamp(dateofcall || ' ' || timeofcall , 'DD-Mon-YY HH24:MI:SS') as dateofcall_cln
,incidentgroup
,stopcodedescription
,specialservicetype
,propertycategory
,propertytype
,addressqualifier
,case when trim(postcode_full) = '' then null else postcode_full end as postcode_full
,postcode_district
,incgeo_boroughname
,upper(incgeo_wardname) as incgeo_wardname
,upper(incgeo_wardnamenew) as incgeo_wardnamenew
,easting_m
,northing_m
,upper(frs) as frs
,upper(incidentstationground) as incidentstationground
,case when numstationswithpumpsattending='NULL' then Null 
	else numstationswithpumpsattending::int end 
	as numstationswithpumpsattending
,case when numpumpsattending = 'NULL' then null
	else numpumpsattending::int end
	as numpumpsattending
from 
(
	select * from proj001_lfb_1_0_0.L1_LFB_Incident_data_from_January_2009_to_December_2012
	
)_;

/*index the clean table*/
DROP INDEX if exists proj001_lfb_1_0_0.dateofcall_ind;

CREATE INDEX dateofcall_ind
  ON proj001_lfb_1_0_0.l2_incidents
  USING btree
  (dateofcall_cln);
ALTER TABLE proj001_lfb_1_0_0.l2_incidents CLUSTER ON dateofcall_ind;


  
/*
select * from proj001_lfb_1_0_0.L2_incidents limit 10;
select min(dateofcall_cln), max(dateofcall_cln) from proj001_lfb_1_0_0.L2_incidents 


*/
