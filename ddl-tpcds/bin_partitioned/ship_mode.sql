create database if not exists ${DB};
use ${DB};

drop table if exists ship_mode;

create table ship_mode
stored as ${FILE}
location 's3a://mmux/${DIR}/ship_mode'
as select * from ${SOURCE}.ship_mode;

alter table ship_mode set TBLPROPERTIES('EXTERNAL'='TRUE');
