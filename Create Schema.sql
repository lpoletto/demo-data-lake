CREATE SCHEMA IF NOT EXISTS minio.f1_bronze
WITH (location = 's3a://demo-bucket/');

--------------------Kafka Schema
CREATE SCHEMA minio.kafka with (LOCATION = 's3a://demo-bucket/');