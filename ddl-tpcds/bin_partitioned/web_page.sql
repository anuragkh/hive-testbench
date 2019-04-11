create database if not exists ${DB};
use ${DB};

drop table if exists web_page;

create table web_page
stored as ${FILE}
location 's3a://mmux/${DIR}/web_page'
as select * from ${SOURCE}.web_page;

alter table web_page set TBLPROPERTIES('EXTERNAL'='TRUE');
