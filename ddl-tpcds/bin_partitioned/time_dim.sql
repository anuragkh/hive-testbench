create database if not exists ${DB};
use ${DB};

drop table if exists time_dim;

create table time_dim
stored as ${FILE}
location 's3://jiffy-hive-tables/${DIR}/time_dim'
as select * from ${SOURCE}.time_dim;

alter table time_dim set TBLPROPERTIES('EXTERNAL'='TRUE');
