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