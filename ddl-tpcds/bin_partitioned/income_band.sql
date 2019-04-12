create database if not exists ${DB};
use ${DB};

drop table if exists income_band;

create table income_band
stored as ${FILE}
location 's3://jiffy-hive-tables/${DIR}/income_band'
as select * from ${SOURCE}.income_band;

alter table income_band set TBLPROPERTIES('EXTERNAL'='TRUE');
