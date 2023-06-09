-- Generated by Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   at:        2021-10-24 17:43:16 CEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE akcja (
    id_akcja                  NUMBER NOT NULL,
    zgloszenie_id_zgloszenie  NUMBER NOT NULL,
    dyspozytor_id_dyspozytora NUMBER NOT NULL,
    jednostka_id_jednostki    NUMBER NOT NULL
);

ALTER TABLE akcja ADD CONSTRAINT akcja_pk PRIMARY KEY ( id_akcja );

CREATE TABLE badania (
    id_badanie       NUMBER NOT NULL,
    data_rozpoczecia DATE NOT NULL,
    data_zakonczenia DATE NOT NULL,
    rodzaj           VARCHAR2(25)
);

ALTER TABLE badania ADD CONSTRAINT badania_pk PRIMARY KEY ( id_badanie );

CREATE TABLE badanie_techniczne (
    id_badanie_techniczne NUMBER NOT NULL,
    data_rozpoczecia      DATE NOT NULL,
    data_zakonczenia      DATE NOT NULL
);

ALTER TABLE badanie_techniczne ADD CONSTRAINT badanie_techniczne_pk PRIMARY KEY ( id_badanie_techniczne );

CREATE TABLE dyspozytor (
    id_dyspozytora NUMBER NOT NULL,
    imie           VARCHAR2(25) NOT NULL,
    nazwisko       VARCHAR2(25) NOT NULL,
    nr_stanowiska  NUMBER(3)
);

ALTER TABLE dyspozytor ADD CONSTRAINT dyspozytor_pk PRIMARY KEY ( id_dyspozytora );

CREATE TABLE jednostka (
    id_jednostki       NUMBER NOT NULL,
    pojazdy_id_pojazdu NUMBER NOT NULL,
    strazak_id_strazak NUMBER NOT NULL
);

ALTER TABLE jednostka ADD CONSTRAINT jednostka_pk PRIMARY KEY ( id_jednostki );

CREATE TABLE pojazdy (
    id_pojazdu                               NUMBER NOT NULL,
    nr_rejestracyjny                         VARCHAR2(8) NOT NULL,
    liczba_osob                              NUMBER,
    rodzaj                                   VARCHAR2(25), 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    badanie_techniczne_id_badanie_techniczne NUMBER NOT NULL
);

ALTER TABLE pojazdy ADD CONSTRAINT pojazdy_pk PRIMARY KEY ( id_pojazdu );

CREATE TABLE strazak (
    id_strazak         NUMBER NOT NULL,
    imie               VARCHAR2(25) NOT NULL,
    nazwisko           VARCHAR2(25) NOT NULL,
    stopien            VARCHAR2(25),
    miejscowosc        VARCHAR2(30) NOT NULL,
    adres              VARCHAR2(40) NOT NULL,
    badania_id_badanie NUMBER NOT NULL,
    zarobki_id_zarobki NUMBER NOT NULL
);

ALTER TABLE strazak ADD CONSTRAINT strazak_pk PRIMARY KEY ( id_strazak );

CREATE TABLE zarobki (
    id_zarobki    NUMBER NOT NULL,
    wysokosc      NUMBER NOT NULL,
    data_przelewu DATE NOT NULL,
    dodatki       NUMBER
);

ALTER TABLE zarobki ADD CONSTRAINT zarobki_pk PRIMARY KEY ( id_zarobki );

CREATE TABLE zglaszajacy (
    id_zglaszajacy           NUMBER NOT NULL,
    imie                     VARCHAR2(25),
    nazwisko                 VARCHAR2(25),
    nr_telefonu              NUMBER,
    zgloszenie_id_zgloszenie NUMBER NOT NULL
);

ALTER TABLE zglaszajacy ADD CONSTRAINT zglaszajacy_pk PRIMARY KEY ( id_zglaszajacy );

CREATE TABLE zgloszenie (
    id_zgloszenie NUMBER NOT NULL,
    rodzaj        VARCHAR2(25),
    miejscowosc   VARCHAR2(30) NOT NULL,
    adres         VARCHAR2(40) NOT NULL
);

ALTER TABLE zgloszenie ADD CONSTRAINT zgloszenie_pk PRIMARY KEY ( id_zgloszenie );

ALTER TABLE akcja
    ADD CONSTRAINT akcja_dyspozytor_fk FOREIGN KEY ( dyspozytor_id_dyspozytora )
        REFERENCES dyspozytor ( id_dyspozytora );

ALTER TABLE akcja
    ADD CONSTRAINT akcja_jednostka_fk FOREIGN KEY ( jednostka_id_jednostki )
        REFERENCES jednostka ( id_jednostki );

ALTER TABLE akcja
    ADD CONSTRAINT akcja_zgloszenie_fk FOREIGN KEY ( zgloszenie_id_zgloszenie )
        REFERENCES zgloszenie ( id_zgloszenie );

ALTER TABLE jednostka
    ADD CONSTRAINT jednostka_pojazdy_fk FOREIGN KEY ( pojazdy_id_pojazdu )
        REFERENCES pojazdy ( id_pojazdu );

ALTER TABLE jednostka
    ADD CONSTRAINT jednostka_strazak_fk FOREIGN KEY ( strazak_id_strazak )
        REFERENCES strazak ( id_strazak );

ALTER TABLE pojazdy
    ADD CONSTRAINT pojazdy_badanie_techniczne_fk FOREIGN KEY ( badanie_techniczne_id_badanie_techniczne )
        REFERENCES badanie_techniczne ( id_badanie_techniczne );

ALTER TABLE strazak
    ADD CONSTRAINT strazak_badania_fk FOREIGN KEY ( badania_id_badanie )
        REFERENCES badania ( id_badanie );

ALTER TABLE strazak
    ADD CONSTRAINT strazak_zarobki_fk FOREIGN KEY ( zarobki_id_zarobki )
        REFERENCES zarobki ( id_zarobki );

ALTER TABLE zglaszajacy
    ADD CONSTRAINT zglaszajacy_zgloszenie_fk FOREIGN KEY ( zgloszenie_id_zgloszenie )
        REFERENCES zgloszenie ( id_zgloszenie );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
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
-- CREATE MATERIALIZED VIEW LOG             0
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
-- ERRORS                                   1
-- WARNINGS                                 0
