--liquibase formatted sql

--changeset DiegoCastro:req_001
INSERT INTO core_persona_dat VALUES (
    1,
    'Pepito peres',
    'CALLE falsa 123',
    'CALLE falsa 456',
    'Bogotá'
);
-- rollback delete core_persona_dat where id=1;