--liquibase formatted sql

--changeset EdgarPalacios:req_001
ALTER TABLE core_mascota_dat
ADD (especie VARCHAR2(20) );



ALTER TABLE core_mascota_dat
ADD (edad VARCHAR2(20) )
-- rollback alter table core_mascota_dat drop column especie;
-- rollback alter table core_mascota_dat drop column edad;