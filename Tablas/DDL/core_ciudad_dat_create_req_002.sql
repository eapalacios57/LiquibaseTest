--liquibase formatted sql

--changeset GabrielBarba:req_002
CREATE TABLE core_ciudad_dat (
    id        INT PRIMARY KEY,
    name      VARCHAR(50) NOT NULL,
    codigo_ciudad      VARCHAR(10) NOT NULL
);
-- rollback drop table core_ciudad_dat;