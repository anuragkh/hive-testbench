create database if not exists ${DB};
use ${DB};

drop table if exists call_center;

create table call_center
stored as ${FILE}
location 's3a://mmux/${DIR}/call_center'
as select * from ${SOURCE}.call_center;

alter table call_center set TBLPROPERTIES('EXTERNAL'='TRUE');