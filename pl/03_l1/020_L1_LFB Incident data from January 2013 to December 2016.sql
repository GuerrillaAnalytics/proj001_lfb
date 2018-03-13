
/*Point to the latest version of the file*/
drop view if exists proj001_lfb_1_0_0.L1_LFB_Incident_data_from_January_2013_to_December_2016;

create view proj001_lfb_1_0_0.L1_LFB_Incident_data_from_January_2013_to_December_2016 as
select * 
from inputs.inp_002_02_LFB_Incident_data_from_January_2013_to_December_2016;

/*
select * from proj001_lfb_1_0_0.L1_LFB_Incident_data_from_January_2013_to_December_2016 limit 10;

*/