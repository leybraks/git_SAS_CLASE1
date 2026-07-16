/* Adapted from CLASE 1/extensiones.sas. The original runs against
   `ventas_filtradas` (see transformaciones.sas) and exports to the
   author's absolute workspace path; the DATA/SQL/macro logic is
   unchanged, the source dataset is seeded inline, and the export target
   is a relative path since this bundle ships no filesystem of its own. */
DATA ventas_filtradas;
    LENGTH nombre $20 ciudad $20;
    INPUT nombre $ edad ciudad $ edad_4_mas;
    DATALINES;
Laura 51 Lima 55
Javier 36 Lima 40
Miguel 41 Lima 45
;
RUN;

/* USO DE SINTAXIS SQL */

PROC SQL;
    SELECT ciudad,
    AVG(edad) AS Promedio_edad
    FROM ventas_filtradas
    GROUP BY ciudad;
QUIT;

/* USO DE MACRO */

%MACRO resumen(tabla);
    PROC MEANS DATA= &tabla N MEAN STD MAXDEC= 2;
    RUN;
%MEND;

%resumen(ventas_filtradas);


PROC EXPORT DATA= ventas_filtradas
OUTFILE= "RESULTADOS.csv"
    DBMS=CSV
    REPLACE;
RUN;
