--liquibase formatted sql

--changeset EdgarPalacios:req_003
CREATE TABLE core_mascota_dat (
    id        INT PRIMARY KEY,
    name      VARCHAR(50) NOT NULL,
    raza  VARCHAR(50)

);
-- rollback drop table core_mascota_dat;