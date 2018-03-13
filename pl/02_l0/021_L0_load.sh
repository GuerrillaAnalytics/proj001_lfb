#!/usr/bin/env bash
HOST=$1
psql -h $HOST -d proj001_lfb -U postgres -w -c "\copy inputs.inp_002_02_LFB_Incident_data_from_January_2009_to_December_2012 FROM '../../inputs/inp_002/02/formatted/data/LFB Incident data from January 2013 to December 2016.csv' DELIMITER ',' CSV HEADER"
