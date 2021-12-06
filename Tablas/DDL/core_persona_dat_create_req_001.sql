--liquibase formatted sql

--changeset DiegoCastro:req_001
CREATE TABLE core_persona_dat (
    id        INT PRIMARY KEY,
    name      VARCHAR(50) NOT NULL,
    address1  VARCHAR(50),
    address2  VARCHAR(50),
    city      VARCHAR(30)
);
-- rollback drop table core_persona_dat;