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
OUTFILE= "/workspaces/sas/CLASE 1/RESULTADOS.csv"
    DBMS=CSV
    REPLACE;
RUN;