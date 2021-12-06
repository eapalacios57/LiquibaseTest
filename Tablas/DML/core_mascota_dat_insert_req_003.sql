--liquibase formatted sql

--changeset EdgarPalcios:req_003
INSERT INTO core_mascota_dat VALUES (
    1,
    'Superman',
    'Criollo'
);
-- rollback delete core_mascota_dat where id=1;