create database if not exists ${DB};
use ${DB};

drop table if exists customer;

create table customer
stored as ${FILE}
location 's3://jiffy-hive-tables/${DIR}/customer'
as select * from ${SOURCE}.customer
CLUSTER BY c_customer_sk;

alter table customer set TBLPROPERTIES('EXTERNAL'='TRUE');