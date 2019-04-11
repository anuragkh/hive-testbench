create database if not exists ${DB};
use ${DB};

drop table if exists reason;

create table reason
stored as ${FILE}
location 's3a://mmux/${DIR}/reason'
as select * from ${SOURCE}.reason;

alter table reason set TBLPROPERTIES('EXTERNAL'='TRUE');
