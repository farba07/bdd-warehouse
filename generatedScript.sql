-- Généré par Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   à :        2020-03-25 05:22:39 CET
--   site :      Oracle Database 11g
--   type :      Oracle Database 11g



CREATE TABLE dim_chomage (
    chomage_id  INTEGER NOT NULL,
    taux_t1     FLOAT,
    taux_t2     FLOAT,
    taux_t3     FLOAT
);

ALTER TABLE dim_chomage ADD CONSTRAINT chomage_pk PRIMARY KEY ( chomage_id );

CREATE TABLE dim_date (
    date_id      INTEGER NOT NULL,
    date_        DATE,
    jour         NVARCHAR2(1),
    num_jour     INTEGER,
    mois         NVARCHAR2(1),
    num_mois     INTEGER,
    annee        INTEGER,
    num_semaine  INTEGER
);

ALTER TABLE dim_date ADD CONSTRAINT date_pk PRIMARY KEY ( date_id );

CREATE TABLE dim_etablissements_par_commune (
    etablissement_id  INTEGER NOT NULL,
    nbre_entreprise   INTEGER,
    categorie_1       INTEGER,
    categorie_0       INTEGER,
    categorie_2       INTEGER,
    categorie_7       INTEGER,
    categorie_3       INTEGER,
    categorie_4       INTEGER,
    categorie_6       INTEGER,
    categorie_5       INTEGER,
    categorie_8       INTEGER
);

ALTER TABLE dim_etablissements_par_commune ADD CONSTRAINT etablissements_pk PRIMARY KEY ( etablissement_id );

CREATE TABLE dim_population (
    population_id      VARCHAR2(200 CHAR) NOT NULL,
    mode_cohabitation  INTEGER,
    tranche_age        INTEGER,
    sexe               INTEGER,
    nbre_personne      INTEGER
);

ALTER TABLE dim_population ADD CONSTRAINT population_pk PRIMARY KEY ( population_id );

CREATE TABLE dim_salaire (
    salaire_id  INTEGER NOT NULL,
    snhm        FLOAT,
    snhmc       FLOAT,
    snhmci      FLOAT,
    snhme       FLOAT,
    snhmo       FLOAT,
    snhmf       FLOAT,
    snhmfc      FLOAT,
    snhmfci     FLOAT,
    snhmfe      FLOAT,
    snhmfo      FLOAT,
    snhmh       FLOAT,
    snhmhc      FLOAT,
    snhmhci     FLOAT,
    snhmhe      FLOAT,
    snhmho      FLOAT,
    snhm18      FLOAT,
    snhm26      FLOAT,
    snhm50      FLOAT,
    snhmf18     FLOAT,
    snhmf26     FLOAT,
    snhmf50     FLOAT,
    snhmh18     FLOAT,
    snhmh26     FLOAT,
    snhmh50     FLOAT
);

ALTER TABLE dim_salaire ADD CONSTRAINT salaire_pk PRIMARY KEY ( salaire_id );

CREATE TABLE dim_zones_geo (
    code_insee        INTEGER NOT NULL,
    eu_circo          NVARCHAR2(1),
    code_region       NUMBER,
    nom_region        NVARCHAR2(200),
    chef_lieu_region  NVARCHAR2(200),
    num_departement   NUMBER,
    nom_departement   NVARCHAR2(200),
    nom_commune       NVARCHAR2(200),
    codes_postaux     NUMBER
);

ALTER TABLE dim_zones_geo ADD CONSTRAINT zones_geo_pk PRIMARY KEY ( code_insee );

CREATE TABLE faits_emploi (
    code_insee        INTEGER NOT NULL,
    date_id           INTEGER NOT NULL,
    salaire_id        INTEGER NOT NULL,
    population_id     VARCHAR2(200 CHAR) NOT NULL,
    etablissement_id  INTEGER NOT NULL,
    chomage_id        INTEGER NOT NULL
);

ALTER TABLE faits_emploi
    ADD CONSTRAINT faits_emploi_pk PRIMARY KEY ( code_insee,
                                                 date_id,
                                                 salaire_id,
                                                 population_id,
                                                 etablissement_id );

ALTER TABLE faits_emploi
    ADD CONSTRAINT faits_emploi_chomage_fk FOREIGN KEY ( chomage_id )
        REFERENCES dim_chomage ( chomage_id );

ALTER TABLE faits_emploi
    ADD CONSTRAINT faits_emploi_date_fk FOREIGN KEY ( date_id )
        REFERENCES dim_date ( date_id );

ALTER TABLE faits_emploi
    ADD CONSTRAINT faits_emploi_etab_par_com_fk FOREIGN KEY ( etablissement_id )
        REFERENCES dim_etablissements_par_commune ( etablissement_id );

ALTER TABLE faits_emploi
    ADD CONSTRAINT faits_emploi_population_fk FOREIGN KEY ( population_id )
        REFERENCES dim_population ( population_id );

ALTER TABLE faits_emploi
    ADD CONSTRAINT faits_emploi_salaire_fk FOREIGN KEY ( salaire_id )
        REFERENCES dim_salaire ( salaire_id );

ALTER TABLE faits_emploi
    ADD CONSTRAINT faits_emploi_zones_geo_fk FOREIGN KEY ( code_insee )
        REFERENCES dim_zones_geo ( code_insee );

CREATE SEQUENCE date_date_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER date_date_id_trg BEFORE
    INSERT ON dim_date
    FOR EACH ROW
    WHEN ( new.date_id IS NULL )
BEGIN
    :new.date_id := date_date_id_seq.nextval;
END;
/

CREATE SEQUENCE dim_etablissements_par_commune START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER dim_etablissements_par_commune BEFORE
    INSERT ON dim_etablissements_par_commune
    FOR EACH ROW
    WHEN ( new.etablissement_id IS NULL )
BEGIN
    :new.etablissement_id := dim_etablissements_par_commune.nextval;
END;
/

CREATE SEQUENCE population_population_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER population_population_id_trg BEFORE
    INSERT ON dim_population
    FOR EACH ROW
    WHEN ( new.population_id IS NULL )
BEGIN
    :new.population_id := population_population_id_seq.nextval;
END;
/

CREATE SEQUENCE salaire_salaire_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER salaire_salaire_id_trg BEFORE
    INSERT ON dim_salaire
    FOR EACH ROW
    WHEN ( new.salaire_id IS NULL )
BEGIN
    :new.salaire_id := salaire_salaire_id_seq.nextval;
END;
/



-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           4
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
-- CREATE SEQUENCE                          4
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
-- ERRORS                                   0
-- WARNINGS                                 0
