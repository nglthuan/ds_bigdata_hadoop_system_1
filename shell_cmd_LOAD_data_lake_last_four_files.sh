#-------------------------------------------
# File name: shell_cmd_load_data_lake_all.sh
#-------------------------------------------

#!/bin/bash

#------------- save my current working directory
# Not need - not change dir
# MY_CWD=$(pwd)

#------------- remove first line of files and rename

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
# Already done for the 1st file
# hdfs dfs -mkdir /user/w205/hospital_compare

#------------- create hdfs directory for each file and copy each file to hdfs

# Already done for the 1st file
# hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
# hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals

hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care

hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions

hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -put measures.csv /user/w205/hospital_compare/measures

hdfs dfs -mkdir /user/w205/hospital_compare/survey_responses
hdfs dfs -put survey_responses.csv /user/w205/hospital_compare/survey_responses

#------------- change directory back to the original
# Not need - not change dir
# cd $MY_CWD

#------------- clean exit
exit


