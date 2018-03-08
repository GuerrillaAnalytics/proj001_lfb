#!/usr/bin/env bash
HOST=$1
psql -h $HOST -d proj001_lfb -U postgres -w -c "\copy inputs.inp_002_01_LFB_Incident_data_from_January_2009_to_December_2012 FROM '../../inputs/inp_002/01/formatted/data/LFB Incident data from January 2009 to December 2012.csv' DELIMITER ',' CSV HEADER"
