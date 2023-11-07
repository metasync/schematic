## [0.2.5] (2023-11-05)

	* Properly handled when image is not found when checking image info via make command
	* Enhanced the way to load job environment settings in development
	* Added environment variable for schematic version in base image
	* Added environment variable for app version in dev image
	* Added basic tasks for loading environment settings and showing version
	* Used DEV_IMAGE in docker compose for project template
	* Added a rake task to test database connection
	* Used hyphen instead of underscore in project path
	* Fixed naming convention for deploy job image
	* Fixed naming convention for base image
	* Added a rake task to show app and Schematic version info
	* Exposed default ports for MS SQL and PostgreSQL for development
	* Changed default migration dir not to contain db name
	* Properly set values for environment variables, SCHEMATIC_HOME, ENV_HOME and APP_HOME and work directory in docker image
	* Added GitOpsConfig generator and related rake tasks

## [0.2.0] (2023-10-26)

	* Fixed a gitignore rule to allow some secret env files to be checked into code repository
	* Refactored make env files to consolidate configuration settings
	* Added environment variables DB_TYPE to indicate database engine: mssql or psql so that database identifier mangling can be properly configured in Ruby Sequel
	* Provided convenient Makefile targets to show related docker images
	* Updated README.md for project creation with proper database passwords configured

## [0.1.5] (2023-10-24)

	* Refactored global configurations and build/deploy/make configurations
	* Refactored database configurations
	* Refactored folder structure
	* Refined project template generation

## [0.1.0] (2023-10-20)

	* Initial commit for the project
