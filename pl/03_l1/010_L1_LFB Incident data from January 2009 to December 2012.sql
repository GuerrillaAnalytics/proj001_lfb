
/*Point to the latest version of the file*/
drop view if exists proj001_lfb_0_1_0.L1_LFB_Incident_data_from_January_2009_to_December_2012;

create view proj001_lfb_0_1_0.L1_LFB_Incident_data_from_January_2009_to_December_2012 as
select * 
from inputs.inp_002_01_LFB_Incident_data_from_January_2009_to_December_2012;

/*
select * from proj001_lfb_0_1_0.L1_LFB_Incident_data_from_January_2009_to_December_2012 limit 10;

*/