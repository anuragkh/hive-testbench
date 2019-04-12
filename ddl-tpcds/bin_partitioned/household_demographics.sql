create database if not exists ${DB};
use ${DB};

drop table if exists household_demographics;

create table household_demographics
stored as ${FILE}
location 's3://jiffy-hive-tables/${DIR}/household_demographics'
as select * from ${SOURCE}.household_demographics;

alter table household_demographics set TBLPROPERTIES('EXTERNAL'='TRUE');
