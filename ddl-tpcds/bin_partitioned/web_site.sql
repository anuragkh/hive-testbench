create database if not exists ${DB};
use ${DB};

drop table if exists web_site;

create table web_site
stored as ${FILE}
location 's3://jiffy-hive-tables/${DIR}/web_site'
as select * from ${SOURCE}.web_site;

alter table web_site set TBLPROPERTIES('EXTERNAL'='TRUE');
