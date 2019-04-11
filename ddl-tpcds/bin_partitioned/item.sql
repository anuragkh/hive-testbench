create database if not exists ${DB};
use ${DB};

drop table if exists item;

create table item
stored as ${FILE}
location 's3a://mmux/${DIR}/item'
as select * from ${SOURCE}.item
CLUSTER BY i_item_sk;

alter table item set TBLPROPERTIES('EXTERNAL'='TRUE');
