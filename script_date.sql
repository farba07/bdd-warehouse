-- --------------------------------------------------------
--
-- Contenu de la table dim_date
--

INSERT INTO dim_date (date_id, date_du_jour, annee_calendaire, semestre, libelle_semestre, trimestre, libelle_trimestre, annee_mois,mois, libelle_mois, semaine, jour, libelle_jour, jour_ferie, jour_ouvre, quantieme_jour)
SELECT
    TO_NUMBER(TO_CHAR(DT_CAL, 'YYYYMMDD')) AS date_id,
    DT_CAL AS date_du_jour,
    TO_NUMBER(TO_CHAR(DT_CAL, 'YYYY')) AS annee_calendaire,
    ROUND(TO_NUMBER(TO_CHAR(DT_CAL, 'Q'))/2) AS semestre,
    CASE ROUND(TO_NUMBER(TO_CHAR(DT_CAL, 'Q'))/2) WHEN 1 THEN '1er semestre' ELSE '2ème semestre' END AS libelle_semestre,
    TO_NUMBER(TO_CHAR(DT_CAL, 'Q')) AS trimestre,
    CASE TO_NUMBER(TO_CHAR(DT_CAL, 'Q')) WHEN 1 THEN '1er trimestre' ELSE TO_NUMBER(TO_CHAR(DT_CAL, 'Q')) || 'ème trimestre' END AS libelle_trimestre,
    TO_NUMBER(TO_NUMBER(TO_CHAR(DT_CAL, 'YYYY')) || LPAD(TO_CHAR(DT_CAL, 'MM'), 2, '0')) AS annee_mois,
    TO_NUMBER(TO_CHAR(DT_CAL, 'MM')) AS mois,
    TO_CHAR(DT_CAL, 'Month') AS libelle_mois,
    TO_NUMBER(TO_CHAR(DT_CAL, 'IW')) AS semaine,
    TO_NUMBER(TO_CHAR(DT_CAL, 'DD')) AS jour,
    TO_CHAR(DT_CAL, 'Day') AS libelle_jour,
    CASE WHEN TO_CHAR(DT_CAL, 'D') IN ('6', '7') THEN 'Oui' ELSE 'Non' END AS jour_ferie,
    CASE WHEN TO_CHAR(DT_CAL, 'D') IN ('6', '7') THEN 'Non' ELSE 'Oui' END AS jour_ouvre,
    NUM_JOUR AS quantieme_jour
FROM
(
 SELECT to_date('19000101','YYYYMMDD') + (rownum - 1) AS DT_CAL, rownum AS NUM_JOUR, level n
    FROM dual
    connect BY level <= 50000
);
COMMIT;
