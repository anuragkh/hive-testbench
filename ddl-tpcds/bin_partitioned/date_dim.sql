create database if not exists ${DB};
use ${DB};

drop table if exists date_dim;

create table date_dim
stored as ${FILE}
location 's3a://mmux/${DIR}/date_dim'
as select * from ${SOURCE}.date_dim;

alter table date_dim set TBLPROPERTIES('EXTERNAL'='TRUE');