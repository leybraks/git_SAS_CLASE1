PROC MEANS DATA=ventas_filtradas N MEAN MIN MAX MAXDEC=2;
    VAR edad;
RUN;

PROC FREQ DATA=ventas_filtradas;
    TABLES edad;
RUN;

DATA ventas_format;
    SET ventas_filtradas;
    FORMAT edad 6.2;
    LABEL edad_4_mas = "Edad egreso";
RUN;

PROC PRINT DATA=ventas_format LABEL;
RUN;