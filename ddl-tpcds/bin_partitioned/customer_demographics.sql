create database if not exists ${DB};
use ${DB};

drop table if exists customer_demographics;

create table customer_demographics
stored as ${FILE}
location 's3://jiffy-hive-tables/${DIR}/customer_demographics'
as select * from ${SOURCE}.customer_demographics;

alter table customer_demographics set TBLPROPERTIES('EXTERNAL'='TRUE');
