-- Generated by Oracle SQL Developer Data Modeler 17.2.0.188.1059
--   at:        2021-10-05 08:58:30 CEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE ksiazki (
    tytul        VARCHAR2(25),
    gatunek      VARCHAR2(25),
    autor        VARCHAR2(25),
    id_ksiazka   NUMBER(7) NOT NULL
);

ALTER TABLE ksiazki ADD CONSTRAINT ksiazki_pk PRIMARY KEY ( id_ksiazka );

CREATE TABLE osoby (
    imie       VARCHAR2(25),
    nazwisko   VARCHAR2(25),
    adres      VARCHAR2(40),
    miasto     VARCHAR2(30),
    pesel      VARCHAR2(11),
    id_osoby   NUMBER(7) NOT NULL
);

ALTER TABLE osoby ADD CONSTRAINT osoby_pk PRIMARY KEY ( id_osoby );

CREATE TABLE wypozyczenia (
    id_wypozyczenia      NUMBER(7) NOT NULL,
    data_wyporzyczenia   DATE,
    data_oddania         DATE,
    ksiazki_id_ksiazka   NUMBER(7) NOT NULL,
    osoby_id_osoby       NUMBER(7) NOT NULL
);

ALTER TABLE wypozyczenia ADD CONSTRAINT wypozyczenia_pk PRIMARY KEY ( id_wypozyczenia );

ALTER TABLE wypozyczenia
    ADD CONSTRAINT wypozyczenia_ksiazki_fk FOREIGN KEY ( ksiazki_id_ksiazka )
        REFERENCES ksiazki ( id_ksiazka );

ALTER TABLE wypozyczenia
    ADD CONSTRAINT wypozyczenia_osoby_fk FOREIGN KEY ( osoby_id_osoby )
        REFERENCES osoby ( id_osoby );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
