--liquibase formatted sql

--changeset GabrielBarba:req_002
INSERT INTO core_ciudad_dat VALUES (
    1,
    'Bucaramanga',
    '001'
);
-- rollback delete core_ciudad_dat where id=1;