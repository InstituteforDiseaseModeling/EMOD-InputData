@echo off
REM ***************************************************************************
REM setup_input_files_directory.bat
REM
REM This utility creates the necessary directories and links in the InputFiles
REM directory with the structure that Diamonds needs.
REM
REM Usage: run this script w/o args from inside the InputFiles directory.
REM Original author: Bill Saunders
REM ***************************************************************************
REM Psuedocode:
REM 1- create links in current dir pointing to all files in subdir.
REM 2- mkdir all of the "dot" dirs required by Diamonds
REM 3- create links in the "dot" dirs pointing to the files as per
REM http://emod-wiki/download/attachments/1998889/InputFileFormat-Alpha-v4.xlsx
REM ***************************************************************************

REM constants
set newline=^& echo.

REM ***************************************************************************
REM add note about running from input_files_directory
echo.
echo -------------------------------------------------------------------------------
echo  EMOD Input Files Directory Preperation
echo.
echo  This script will create the necessary subdirectories and links for Diamonds
echo  It needs to be run from the main input_files directory as specified in the 
echo  LegacyServer's Web.config (reference the installation documentation for more
echo  information.
echo -------------------------------------------------------------------------------
echo.
echo If you are in the input_files directory, and you wish to prepare it for use 
echo with Diamonds, then press lower case y and hit return.  Any other key will
echo exit.  Type y or n:
rem add get key to allow abort
set /p Input=
if /i "%Input%"=="y" (goto Proceed)
echo.
echo setup_input_files_directory.bat aborted, directory not setup.
echo.
exit /b
:Proceed
echo.
echo "Preparing directories and links.  Already existing directories may generate"
echo "errors.  Please review the output to make sure all directories and links were"
echo "created correctly."
echo.

REM ***************************************************************************
REM Link all files in subdirs to this "toplevel" dir.  Ie links here pointing to the subdirs
REM mkdir all the "dot" subdirs
REM link the proper files into the toplevel
move Bihar-Like_2x2\Bihar_2x2_sandbox_demographics.dat .
move Bihar-Like_1_Node\Bihar_single_node_demographics.dat .

rem DIAM-1063
move Bihar_single_node_pool_definition_neighborhood_work_school_example.json .
move Bihar_single_node_pool_definition_two_social_group_example.json .
move Bihar_single_node_pool_type_neighborhood_work_school_example.json .
move Bihar_single_node_pool_type_two_social_group_example.json .

move Bihar-Like_2x2\Bihar_2x2_sandbox_local_migration.bin .
move Bihar-Like_Torus_10x10\Bihar_10x10_torus_demographics.dat .
move Bihar-Like_Torus_10x10\Bihar_10x10_torus_local_migration.bin .
move Garki\Garki_30arcsec_air_temperature_daily.bin .
move Garki\Garki_30arcsec_demographics.dat .
move Garki\Garki_30arcsec_land_temperature_daily.bin .
move Garki\Garki_30arcsec_local_migration.bin .
move Garki\Garki_30arcsec_rainfall_daily.bin .
move Garki\Garki_30arcsec_relative_humidity_daily.bin .
move Garki\Garki_30arcsec_air_temperature_daily.bin.json .
move Garki\Garki_30arcsec_land_temperature_daily.bin.json .
move Garki\Garki_30arcsec_rainfall_daily.bin.json .
move Garki\Garki_30arcsec_relative_humidity_daily.bin.json .
move India\India_2_5arcmin_air_migration.bin .
move India\India_2_5arcmin_demographics.dat .
move India\India_2_5arcmin_koppen_climate.bin .
move India\India_2_5arcmin_koppen_climate.bin.json .
move India\India_2_5arcmin_load_balancing.bin .
move India\India_2_5arcmin_local_migration.bin .
move India\India_2_5arcmin_regional_migration.bin .
move "India Northern"\NorthIndia_2_5arcmin_air_migration.bin .
move "India Northern"\NorthIndia_2_5arcmin_demographics.dat .
move "India Northern"\NorthIndia_2_5arcmin_koppen_climate.bin .
move "India Northern"\NorthIndia_2_5arcmin_koppen_climate.bin.json .
move "India Northern"\NorthIndia_2_5arcmin_load_balancing.bin .
move "India Northern"\NorthIndia_2_5arcmin_local_migration.bin .
move "India Northern"\NorthIndia_2_5arcmin_regional_migration_linear_population_dependence.bin .

REM for DIAM-841
Copy NorthIndia_2_5arcmin_regional_migration_linear_population_dependence.bin NorthIndia_2_5arcmin_regional_migration.bin

move "India Northern"\NorthIndia_2_5arcmin_regional_migration_no_population_dependence.bin .
move "India Northern"\NorthIndia_2_5arcmin_regional_migration_square_population_dependence.bin .
move Madagascar\Madagascar_2_5arcmin_air_temperature_daily.bin .
move Madagascar\Madagascar_2_5arcmin_koppen_climate.bin .
move Madagascar\Madagascar_2_5arcmin_land_temperature_daily.bin .
move Madagascar\Madagascar_2_5arcmin_rainfall_daily.bin .
move Madagascar\Madagascar_2_5arcmin_relative_humidity_daily.bin .
move Madagascar\Madagascar_2_5arcmin_demographics.dat .
move Madagascar\Madagascar_2_5arcmin_load_balancing_comm.bin .
move Madagascar\Madagascar_2_5arcmin_local_migration.bin .
move Madagascar\Madagascar_2_5arcmin_regional_migration.bin .
move Madagascar\Madagascar_2_5arcmin_sea_migration.dat .
move Madagascar\Madagascar_2_5arcmin_air_temperature_daily.bin.json .
move Madagascar\Madagascar_2_5arcmin_koppen_climate.bin.json .
move Madagascar\Madagascar_2_5arcmin_land_temperature_daily.bin.json .
move Madagascar\Madagascar_2_5arcmin_rainfall_daily.bin.json .
move Madagascar\Madagascar_2_5arcmin_relative_humidity_daily.bin.json .
move Muheza\Muheza_single_node_air_temperature_daily.bin .
move Muheza\Muheza_single_node_demographics.dat .
move Muheza\Muheza_single_node_land_temperature_daily.bin .
move Muheza\Muheza_single_node_rainfall_daily.bin .
move Muheza\Muheza_single_node_relative_humidity_daily.bin .
move Muheza\Muheza_single_node_air_temperature_daily.bin.json .
move Muheza\Muheza_single_node_land_temperature_daily.bin.json .
move Muheza\Muheza_single_node_rainfall_daily.bin.json .
move Muheza\Muheza_single_node_relative_humidity_daily.bin.json .
move Namawala\Namawala_single_node_air_temperature_daily.bin .
move Namawala\Namawala_single_node_demographics.dat .
move Namawala\Namawala_single_node_land_temperature_daily.bin .
move Namawala\Namawala_single_node_rainfall_daily.bin .
move Namawala\Namawala_single_node_relative_humidity_daily.bin .
move Namawala\Namawala_single_node_air_temperature_daily.bin.json .
move Namawala\Namawala_single_node_land_temperature_daily.bin.json .
move Namawala\Namawala_single_node_rainfall_daily.bin.json .
move Namawala\Namawala_single_node_relative_humidity_daily.bin.json .
move Seattle\Seattle_30arcsec_demographics.dat .
move Seattle\Seattle_30arcsec_local_migration.bin .
move Seattle\Seattle_30arcsec_regional_migration.bin .
move Singleton_Single_Node_Sandbox\Standard_single_node_demographics.dat .
move World\Global_1degree_air_migration.bin .
move World\Global_1degree_demographics.dat .
move World\Global_1degree_koppen_climate.bin .
move World\Global_1degree_load_balancing.bin .
move World\Global_1degree_local_migration.bin .
move World\Global_1degree_sea_migration_1918.dat .
move World\Global_1degree_koppen_climate.bin.json .

REM ***************************************************************************
REM mkdir all the "dot" subdirs
REM Note: meta data currently ignored (not used by Diamonds)
REM Demographic	_demographics.dat	
REM Local Migration	_local_migration.bin	
REM Air Migration	_air_migration.bin	
REM Regional Migration	_regional_migration.bin	
REM Sea Migration	_sea_migration.dat	
REM Air Temp	_air_temperature_daily.bin	
	REM Air Temp (metadata)	_air_temperature_daily.bin.json	
REM Land Temp	_land_temperature_daily.bin	
	REM Land Temp (metadata)	_land_temperature_daily.bin.json	
REM Rainfall	_rainfall_daily.bin	
	REM Rainfall (metadata)	_rainfall_daily.bin.json	
REM Humidity	_relative_humidity_daily.bin	
	REM Humidity (metadata)	_relative_humidity_daily.bin.json	
REM Koppen	_koppen_climate.bin	
	REM Koppen (metadata)	_koppen_climate.bin.json	
REM Load Balancing	_load_balancing.bin	
	REM Mixing Pool - Definition	_pool_definition_XXXX.json	
	REM Mixing Pool - Pool Types	_pool_types_XXXX.json	
mkdir .demographics
mkdir .local_migration
mkdir .air_migration
mkdir .regional_migration
mkdir .sea_migration
mkdir .air_temperature
mkdir .land_temperature
mkdir .rainfall
mkdir .relative_humidity
mkdir .koppen
mkdir .load_balancing

REM ***************************************************************************
REM 3- create links in the "dot" dirs pointing to the files as per
REM http://emod-wiki/download/attachments/1998889/InputFileFormat-Alpha-v4.xlsx
REM
REM All files below were identified by:
REM svn ls -vR https://10.128.50.25:443/svn/Data_Files/trunk
REM Then each group was identified via the xls above and grep
REM ie:  grep _local_migr filenamesonly.txt

REM ****************************************
echo Creating links in .\.demographics
cd .\.demographics
echo "" > Bihar_single_node_demographics.dat
echo "" > Bihar_2x2_sandbox_demographics.dat
echo "" > Bihar_10x10_torus_demographics.dat
echo "" > Garki_30arcsec_demographics.dat
echo "" > India_2_5arcmin_demographics.dat
echo "" > NorthIndia_2_5arcmin_demographics.dat
echo "" > Madagascar_2_5arcmin_demographics.dat
echo "" > Muheza_single_node_demographics.dat
echo "" > Namawala_single_node_demographics.dat
echo "" > Seattle_30arcsec_demographics.dat
echo "" > Standard_single_node_demographics.dat
echo "" > Global_1degree_demographics.dat
cd ..

REM ****************************************
echo Creating links in .\.local_migration
cd .\.local_migration
echo "" > Bihar_2x2_sandbox_local_migration.bin
echo "" > Bihar_10x10_torus_local_migration.bin
echo "" > Garki_30arcsec_local_migration.bin
echo "" > India_2_5arcmin_local_migration.bin
echo "" > NorthIndia_2_5arcmin_local_migration.bin
echo "" > Madagascar_2_5arcmin_local_migration.bin
echo "" > Seattle_30arcsec_local_migration.bin
echo "" > Global_1degree_local_migration.bin
cd ..

REM ****************************************
echo Creating links in .\.air_migration
cd .\.air_migration
echo "" > India_2_5arcmin_air_migration.bin
echo "" > NorthIndia_2_5arcmin_air_migration.bin
echo "" > Global_1degree_air_migration.bin
cd .. 

REM ****************************************
echo Creating links in .\.regional_migration
cd .\.regional_migration
echo "" > India_2_5arcmin_regional_migration.bin
echo "" > NorthIndia_2_5arcmin_regional_migration_linear_population_dependence.bin

REM for DIAM-841
echo "" > NorthIndia_2_5arcmin_regional_migration.bin

echo "" > NorthIndia_2_5arcmin_regional_migration_no_population_dependence.bin
echo "" > NorthIndia_2_5arcmin_regional_migration_square_population_dependence.bin
echo "" > Madagascar_2_5arcmin_regional_migration.bin
echo "" > Seattle_30arcsec_regional_migration.bin
cd ..

REM ****************************************
echo Creating links in .\.sea_migration
cd .\.sea_migration
echo "" > Madagascar_2_5arcmin_sea_migration.dat
echo "" > Global_1degree_sea_migration_1918.dat
cd ..

REM ****************************************
echo Creating links in .\.air_temperature
cd .\.air_temperature
echo "" > Garki_30arcsec_air_temperature_daily.bin
echo "" > Madagascar_2_5arcmin_air_temperature_daily.bin
echo "" > Muheza_single_node_air_temperature_daily.bin
echo "" > Namawala_single_node_air_temperature_daily.bin
cd ..

REM ****************************************
echo Creating links in .\.land_temperature
cd .\.land_temperature
echo "" > Garki_30arcsec_land_temperature_daily.bin
echo "" > Madagascar_2_5arcmin_land_temperature_daily.bin
echo "" > Muheza_single_node_land_temperature_daily.bin
echo "" > Namawala_single_node_land_temperature_daily.bin
cd ..

REM ****************************************
echo Creating links in .\.rainfall
cd .\.rainfall
echo "" > Garki_30arcsec_rainfall_daily.bin
echo "" > Madagascar_2_5arcmin_rainfall_daily.bin
echo "" > Muheza_single_node_rainfall_daily.bin
echo "" > Namawala_single_node_rainfall_daily.bin
cd ..

REM ****************************************
echo Creating links in .\.relative_humidity
cd .\.relative_humidity
echo "" > Garki_30arcsec_relative_humidity_daily.bin
echo "" > Madagascar_2_5arcmin_relative_humidity_daily.bin
echo "" > Muheza_single_node_relative_humidity_daily.bin
echo "" > Namawala_single_node_relative_humidity_daily.bin
cd ..

REM ****************************************
echo Creating links in .\.koppen
cd .\.koppen
echo "" > India_2_5arcmin_koppen_climate.bin
echo "" > NorthIndia_2_5arcmin_koppen_climate.bin
echo "" > Madagascar_2_5arcmin_koppen_climate.bin
echo "" > Global_1degree_koppen_climate.bin
cd ..

REM ****************************************
echo Creating links in .\.load_balancing
cd .\.load_balancing
echo "" > India_2_5arcmin_load_balancing.bin
echo "" > NorthIndia_2_5arcmin_load_balancing.bin
echo "" > Madagascar_2_5arcmin_load_balancing_comm.bin
echo "" > Global_1degree_load_balancing.bin
cd ..

REM ***************************************************************************
echo Done with setup, check that a significant number of links were created
echo in this directory, as well as "dot" directories were created, and 
echo links in them.
