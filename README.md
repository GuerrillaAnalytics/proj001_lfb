# proj001_lfb
Example training project for Guerrilla Analytics ways of working

## Import first data file `002_import_data`
* see the `setup` folder
  * script for creation of `input` and `wp` workproduct schemas. These are the basic structure of the data environment


* see L0 scripts folder for data import code.
  * target table is created
  * load script pushes the file from the inputs folder into the target table.
  * all data is loaded into the `inputs` namespace in the data environment with the same namespace as the `inputs` folder structure.
  * input file names are maintained in database table names as much as is practical


## Create first workproduct `003_first_workproduct`
* see the first workproduct under the `wp` folder
  * the workproduct has an ID and this ID is used in workproduct filenames. This helps with traceability
  * the workproduct code is pointing at the raw input data loaded in the previous step. This means the workproduct code potentially needs to do significant cleaning work before using the data.


## Checkpoint
At this point, we have already come quite far in terms of data provenance and better management of our project.

1. All input data is stored in one place with a simple convention that identifies the data source and the version of the source.
2. All input data is loaded into a well defined place in a database (the `inputs` schema). 3. There is not need to document this because the same namespace and files names are used in the `inputs` folder and in the database.
4. Workproducts point at a single source of the truth that is never altered so we have reduced the risk of inconsistency in interpreting the data.

However, some challenges remain.
1. Every workproduct needs to clean its own data. This is inefficient and it risks inconsistency in the application of cleaning rules and other business rules.
2. If new data arrives, references to raw datasets have to be changed in many places in the code.
