--liquibase formatted sql

--changeset EdgarPalcios:req_004
UPDATE core_mascota_dat SET edad='6', especie='Gato' WHERE id=1
-- rollback  UPDATE core_mascota_dat SET edad=null, especie=null WHERE id=1;