create database if not exists ${DB};
use ${DB};

drop table if exists warehouse;

create table warehouse
stored as ${FILE}
location 's3a://mmux/${DIR}/warehouse'
as select * from ${SOURCE}.warehouse;

alter table warehouse set TBLPROPERTIES('EXTERNAL'='TRUE');
