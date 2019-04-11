create database if not exists ${DB};
use ${DB};

drop table if exists customer_address;

create table customer_address
stored as ${FILE}
location 's3a://mmux/${DIR}/customer_address'
as select * from ${SOURCE}.customer_address 
CLUSTER BY ca_address_sk;

alter table customer_address set TBLPROPERTIES('EXTERNAL'='TRUE');
