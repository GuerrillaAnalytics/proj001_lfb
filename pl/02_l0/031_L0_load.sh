#!/usr/bin/env bash
HOST=$1
psql -h $HOST -d proj001_lfb -U postgres -w -c "\copy inputs.inp_002_03_LFB_Incident_data_from_January_2017 FROM '../../inputs/inp_002/03/formatted/data/LFB Incident data from January 2017.csv' DELIMITER ',' CSV HEADER"
