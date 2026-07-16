/* Adapted from CLASE 1/ordenar.sas. The original PROC IMPORTs carreras.xlsx
   and datos.txt separately, then SORTs and MERGEs them by nombre; since
   this bundle ships no data files, both source datasets are seeded inline
   with the repo's own rows (carreras.xlsx has 3 students: Ana, Luis,
   Maria; datos.txt has the matching first names) and the SORT + MERGE
   logic below is unchanged from the source. */
DATA carreras;
    LENGTH nombre $20 carrera $20;
    INPUT nombre $ carrera $;
    DATALINES;
Ana ing_industrial
Luis ing_mecanica
Maria ing_datos
;
RUN;

DATA ventas;
    LENGTH nombre $20 ciudad $20;
    INPUT nombre $ edad ciudad $;
    DATALINES;
Ana 28 Madrid
Luis 45 BuenosAires
Maria 32 CiudadDeMexico
Carlos 19 Santiago
Laura 51 Lima
;
RUN;

PROC SORT DATA= carreras; BY nombre; RUN;
PROC SORT DATA= ventas; BY nombre; RUN;

DATA ventas_completa;
    LENGTH nombre $50 ciudad $40;
    MERGE ventas (IN=a) carreras (IN=b);
    BY nombre;
    IF a AND b;
RUN;

PROC PRINT DATA=ventas_completa(OBS=5);
RUN;
