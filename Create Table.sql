CREATE SCHEMA IF NOT EXISTS minio.f1_bronze
WITH (location = 's3a://demo-bucket/');

-- Son VARCHAR porque en formato CSV no admite INT o DOUBLE
-- En formato Parquet, sí admite los demas tipos de datos
CREATE TABLE IF NOT EXISTS minio.f1_bronze.circuits (
  circuitId VARCHAR,
  circuitRef VARCHAR,
  location VARCHAR,
  country VARCHAR,
  lat VARCHAR,
  lng VARCHAR,
  alt VARCHAR,
  url VARCHAR
)
WITH (
  external_location = 's3a://demo-bucket/',
  format = 'CSV'
);

--------------------kafka TABLE--------------
CREATE TABLE minio.kafka.tblsales (
   productkey INTEGER,
   customerkey INTEGER,
   salesterritorykey INTEGER,
   salesordernumber varchar,
   totalproductcost DOUBLE,
   salesamount DOUBLE,
   id INTEGER
)
WITH (
   external_location = 's3a://kafka-bucket/topics/src.public.factinternetsales_streaming/partition=0/',
   format = 'JSON'
);

------------Select Query
select * from minio.kafka.tblsales
order by salesordernumber