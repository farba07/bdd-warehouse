# Entrepot de données 

## Processus 

Etude sur le marché de l'emploi francais et comparaison avec le taux de chômage par trimestre.


## Grain de processus


## Dimensions et table des faits
### Dimension

Etablissements : Cette dimension donne des informations sur le nombre d'entreprises dans chaque ville française, classées par taille.
Ces données proviennent de l'INSEE.

```bash
 CREATE TABLE "SYSTEM"."DIM_ETABLISSEMENTS_PAR_COMMUNE" 
   (	"NBRE_ENTREPRISE" NUMBER(*,0), 
	"CATEGORIE_1" NUMBER(*,0), 
	"CATEGORIE_0" NUMBER(*,0), 
	"CATEGORIE_2" NUMBER(*,0), 
	"CATEGORIE_7" NUMBER(*,0), 
	"CATEGORIE_3" NUMBER(*,0), 
	"CATEGORIE_4" NUMBER(*,0), 
	"CATEGORIE_6" NUMBER(*,0), 
	"CATEGORIE_5" NUMBER(*,0), 
	"CATEGORIE_8" NUMBER(*,0), 
	"ETABLISSEMENT_ID" VARCHAR2(200 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.DIM_ETABLISSEMENTS_PAR_COMMUNE
SET DEFINE OFF;
```

## Schema en etoile

![shema en étoile](images/etoile.PNG)


## Oracle - SQL Developper


## Integration avec Talend

## Installation


## Auteurs
* Papa Farba Ndour
* Babacar Ndour
* Fatim Toure

## License

This project is licensed under the [MIT License](https://choosealicense.com/licenses/mit/) - see the LICENSE.md file for details.
