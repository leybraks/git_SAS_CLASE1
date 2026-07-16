/* Adapted from CLASE 1/transformaciones.sas. The original operates on
   `ventas`, produced upstream by importacionTXT.sas from datos.txt; since
   this bundle ships no data files, the same rows (same names/edad/ciudad
   as datos.txt) are seeded here with inline DATALINES so the filter,
   derived column, and PROC SORT below are unchanged from the source. */
DATA ventas;
    LENGTH nombre $20 ciudad $20;
    INPUT nombre $ edad ciudad $;
    DATALINES;
Ana 28 Madrid
Luis 45 BuenosAires
Maria 32 CiudadDeMexico
Carlos 19 Santiago
Laura 51 Lima
Javier 36 Lima
Sofia 22 Montevideo
Diego 60 Quito
Valentina 29 Caracas
Miguel 41 Lima
;
RUN;

/* TRANSFORMACIONES */

/* CREAR UNA COLUMNA */
DATA ventas_filtradas;
    SET ventas;
    IF ciudad = "Lima";
    edad_4_mas = edad + 4;
RUN;

PROC PRINT DATA= ventas_filtradas;
RUN;

/* ORDENACIONES */

PROC SORT DATA=ventas_filtradas OUT=ordenadas;
    BY DESCENDING edad;
RUN;

PROC PRINT DATA=ordenadas;
RUN;
