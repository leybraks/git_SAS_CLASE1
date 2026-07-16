/* Adapted from CLASE 1/EstadisticaBasica.sas. The original runs against
   `ventas_filtradas`, produced upstream by transformaciones.sas (a filter
   on ciudad="Lima" plus a derived edad_4_mas column applied to the
   datos.txt rows); since this bundle ships no data files, the same
   filtered rows are seeded here directly and the PROC MEANS / PROC FREQ /
   FORMAT / LABEL steps below are unchanged from the source. */
DATA ventas_filtradas;
    LENGTH nombre $20 ciudad $20;
    INPUT nombre $ edad ciudad $ edad_4_mas;
    DATALINES;
Laura 51 Lima 55
Javier 36 Lima 40
Miguel 41 Lima 45
;
RUN;

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
