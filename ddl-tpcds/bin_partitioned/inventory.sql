create database if not exists ${DB};
use ${DB};

drop table if exists inventory;

create table inventory
stored as ${FILE}
location 's3a://mmux/${DIR}/inventory'
as select * from ${SOURCE}.inventory
CLUSTER BY inv_date_sk;

alter table inventory set TBLPROPERTIES('EXTERNAL'='TRUE');
