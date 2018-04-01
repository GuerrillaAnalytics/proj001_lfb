#!/usr/bin/env bash

echo "Grabbing raw pet data"
mkdir -p ./inputs/inp_001/01/raw/data

curl  https://files.datapress.com/london/dataset/animal-rescue-incidents-attended-by-lfb/2018-03-20T11:57:48.47/Animal%20Rescue%20incidents%20attended%20by%20LFB%20from%20Jan%202009.csv > "./inputs/inp_001/01/raw/data/Animal Rescue incidents attended by LFB from Jan 2009.csv"


echo "Grabbing incident data 2009-2012"
mkdir -p ./inputs/inp_002/01/formatted/data
mkdir -p ./inputs/inp_002/01/raw/data

curl https://files.datapress.com/london/dataset/london-fire-brigade-incident-records/2016-02-25T15:34:01/LFB%20Incident%20data%20from%20Jan2009%20-%20Dec2012.zip > "./inputs/inp_002/01/raw/data/LFB Incident data from January 2009 to December 2012.zip"

unzip -o "./inputs/inp_002/01/raw/data/LFB Incident data from January 2009 to December 2012.zip" -d ./inputs/inp_002/01/formatted/data/

echo "Grabbing incident data 2013-2016"
mkdir -p ./inputs/inp_002/02/formatted/data
mkdir -p ./inputs/inp_002/02/raw/data

curl https://files.datapress.com/london/dataset/london-fire-brigade-incident-records/2017-12-05T12:46:54.51/LFB%20Incident%20data%20from%20January%202013%20to%20December%202016.zip > "./inputs/inp_002/02/raw/data/LFB Incident data from January 2013 to December 2016.zip"

unzip -o "./inputs/inp_002/02/raw/data/LFB Incident data from January 2013 to December 2016.zip" -d ./inputs/inp_002/02/formatted/data/

echo "Grabbing incident data 2017"
mkdir -p ./inputs/inp_002/03/formatted/data
mkdir -p ./inputs/inp_002/03/raw/data

curl https://files.datapress.com/london/dataset/london-fire-brigade-incident-records/2018-03-20T13:47:40.35/LFB%20Incident%20data%20from%20January%202017.xlsx > "./inputs/inp_002/03/raw/data/LFB Incident data from January 2017.xlsx"


echo "done!"