CREATE DATABASE DATA_INGESTION;
USE DATA_INGESTION;

CREATE TABLE IF NOT EXISTS repo_commit_v1(COMMIT_ID VARCHAR(40),AUTHOR_NAME VARCHAR(40),AUTHOR_EMAIL VARCHAR(120),DATE_GMT TIMESTAMP ,DATE_STRING TIMESTAMP, MERGES_COUNT INT(10));

LOAD DATA INFILE '/var/tmp/data/data.csv'
INTO TABLE repo_commit_v1
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(commit_id,author_name,author_email,@date_gmt_in,@date_string_in,merges_count)
SET date_gmt=    (str_to_date(@date_gmt_in   ,'%a %b %d %Y %H:%i:%s')),
	date_string =(str_to_date(@date_string_in,'%a %b %d %H:%i:%s %Y'))
;

/* Does not work as this is using data format that is not same for both columns 

CREATE TABLE IF NOT EXISTS REPO_COMMIT(COMMIT_ID VARCHAR(40),AUTHOR_NAME VARCHAR(40),AUTHOR_EMAIL VARCHAR(120),DATE_GMT TIMESTAMP ,DATE_STRING TIMESTAMP, MERGES_COUNT INT(10));

delete repo_commit;
LOAD DATA INFILE '/var/tmp/data/data.csv'
INTO TABLE repo_commit
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(commit_id,author_name,author_email,@date_gmt_in,@date_string_in,merges_count)
SET date_gmt=    (str_to_date(@date_gmt_in   ,'%a %b %d %Y %H:%i:%s')),
	date_string =(str_to_date(@date_string_in,'%a %b %d %Y %H:%i:%s'))
;
*/
