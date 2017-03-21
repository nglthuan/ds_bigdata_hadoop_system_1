#-------------------------------------------
# File name: shell_cmd_LOAD_data_lake_ALL.sh
#-------------------------------------------

#!/bin/bash

#------------- save my current working directory
MY_CWD=$(pwd)

#------------- creating staging directories
mkdir ~/staging
mkdir ~/staging/exercise_1

# change to staging directory
cd ~/staging/exercise_1

#------------- get file from data.medicare.gov
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicare_data.zip

# unzip the medicare data
unzip medicare_data.zip

#------------- remove first line of files and rename

OLD_FILE="Hospital General Information.csv"
NEW_FILE="hospitals.csv"
tail -n +2 "$OLD_FILE" >$NEW_FILE

OLD_FILE="Timely and Effective Care - Hospital.csv"
NEW_FILE="effective_care.csv"
tail -n +2 "$OLD_FILE" >$NEW_FILE

OLD_FILE="Readmissions and Deaths - Hospital.csv"
NEW_FILE="readmissions.csv"
tail -n +2 "$OLD_FILE" >$NEW_FILE

OLD_FILE="Measure Dates.csv"
NEW_FILE="measures.csv"
tail -n +2 "$OLD_FILE" >$NEW_FILE

OLD_FILE="hvbp_hcahps_11_10_2016.csv"
NEW_FILE="survey_responses.csv"
tail -n +2 "$OLD_FILE" >$NEW_FILE

#------------- create our main hospital compare hdfs directory
hdfs dfs -mkdir /user/w205/hospital_compare

#------------- create hdfs directory for each file and copy each file to hdfs

hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals

hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care

hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions

hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -put measures.csv /user/w205/hospital_compare/measures

hdfs dfs -mkdir /user/w205/hospital_compare/survey_responses
hdfs dfs -put survey_responses.csv /user/w205/hospital_compare/survey_responses

#------------- change directory back to the original
cd $MY_CWD

#------------- clean exit
exit

