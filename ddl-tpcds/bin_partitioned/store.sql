create database if not exists ${DB};
use ${DB};

drop table if exists store;

create table store
stored as ${FILE}
location 's3://jiffy-hive-tables/${DIR}/store'
as select * from ${SOURCE}.store
CLUSTER BY s_store_sk;

alter table store set TBLPROPERTIES('EXTERNAL'='TRUE');
