
/*Point to the latest version of the file*/
drop view if exists proj001_lfb_1_0_0.L1_LFB_Incident_data_from_January_2017;

create view proj001_lfb_1_0_0.L1_LFB_Incident_data_from_January_2017 as
select * 
from inputs.inp_002_03_LFB_Incident_data_from_January_2017;

/*
select * from proj001_lfb_1_0_0.L1_LFB_Incident_data_from_January_2017 limit 10;

*/