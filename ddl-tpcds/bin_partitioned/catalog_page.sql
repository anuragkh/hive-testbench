create database if not exists ${DB};
use ${DB};

drop table if exists catalog_page;

create table catalog_page
stored as ${FILE}
location 's3a://mmux/${DIR}/catalog_page'
as select * from ${SOURCE}.catalog_page;

alter table catalog_page set TBLPROPERTIES('EXTERNAL'='TRUE');
