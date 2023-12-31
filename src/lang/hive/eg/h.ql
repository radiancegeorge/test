CREATE TABLE IF NOT EXISTS Customer(
    id STRING,
    name STRING,
    description STRING,
    website STRING,
    media_fk STRING
)
STORED AS PARQUET;

CREATE TABLE IF NOT EXISTS Contact(
    id STRING,
    name STRING,
    phone STRING,
    email STRING,
    customer STRING
)
STORED AS PARQUET;

CREATE TABLE Media(
    id INT,
    media_link STRING
)
STORED AS PARQUET;