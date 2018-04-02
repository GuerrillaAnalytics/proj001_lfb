# proj001_lfb
Example training project for Guerrilla Analytics ways of working

## Import first data file `002_import_data`
* see the `setup` folder
  * there is a script for creation of `input` and `wp` workproduct schemas. These are the basic structures of the data environment. `input` contains all data and versions of data received. `wp` contains all outputs and outputs versions produced.


* see L0 scripts folder for data import code.
  * a target table is created
  * load script pushes the file from the inputs folder into the target table.
  * all data is loaded into the `inputs` namespace in the data environment with the same name as the `inputs` folder structure.
  * input file names are maintained in database table names as much as is practical.
