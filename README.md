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


## Clean data `004_clean_data`
* See the L1 folder in the pipeline.
  * We are now building the pipeline into a versioned namespace `proj001_lfb_0_0_1`. This allows us to keep backwards compatibility with older pipelines and make sure that older work products continue to work.
  * a teardown script clears out this namespace at the start of the pipeline build. This makes sure old orphaned datasets are not persisted and accidentally used by workproducts.
  * the L1 script points at the latest raw data. This is useful when data is broken or gets refreshed and we want to be clear that we are pointing at the latest data.   
* See the `L2` code folder
  * The cleaning code gives the dataset a sensible cleaned name used by the rest of the pipeline. This is important because it allows us to decouple the downstream pipeline code from the raw data being processed. Raw data will be refreshed and we want to minimised the downstream code changes this causes.
* See the script `build.sh` in the root of the pipeline code folder. This automates running all `.sh` and `.sql` scripts that are found in the pipeline code.
  * a build script allows you to quickly and easily tear down and rebuild a pipeline. This encourages frequent rebuilds, making you more agile and helping you uncover integration bugs between the various pipeline data steps.
* See the second workproduct folder
  * This new workproduct is now using the pipeline clean dataset in `L2`.
  * This simplifies the workproduct code.
  * This makes the code more efficient
  * There is only one place where agreed cleaning rules are applied - the pipeline.

## Checkpoint
This is another sensible checkpoint for a team's maturity.

1. Cleaning rules are now consistently applied in one place instead of scattered through workproducts
2. Potentially large datasets are in a database where they can be accessed by multiple team members concurrently and in a performant way.
3. If rules change, a new pipeline version can be built into a new pipeline namespace (`proj001_lfb_0_0_1`, `proj001_lfb_0_0_2` etc.). This means that older workproducts do not break. The impact of changes can be measured by diffing datasets between different pipeline versions.
4. A build script allows the building of the pipeline to be easily automated. 

## Model data `005_model_data`
Now start looking at the entities in the data so they can be pulled into a normalised model. `wp_003_normal_model` explores relationships in the incidents data and draws conclusions on how the data should be modeled.

* open `wp_003_normal_model`. See how the uniqueness of entities and whether they have one-to-many relationships is explored. 
