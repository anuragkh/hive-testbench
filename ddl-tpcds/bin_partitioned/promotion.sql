create database if not exists ${DB};
use ${DB};

drop table if exists promotion;

create table promotion
stored as ${FILE}
location 's3a://mmux/${DIR}/promotion'
as select * from ${SOURCE}.promotion;

alter table promotion set TBLPROPERTIES('EXTERNAL'='TRUE');
