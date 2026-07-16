/* Adapted from CLASE 1/importacionCSV.sas.
   The original reads datos.csv via PROC IMPORT DBMS=CSV; this bundle
   ships no data files (the runner only sends this script), so the same
   rows are read with the same comma-delimited, header-row semantics
   PROC IMPORT DBMS=CSV uses, via INFILE DATALINES DSD. */
DATA ventas_csv;
    INFILE DATALINES DSD DLM=',';
    LENGTH nombre $30 ciudad $20;
    INPUT nombre $ edad ciudad $;
    DATALINES;
Ana Garcia,28,Madrid
Luis Rodriguez,45,Buenos Aires
Maria Fernandez,32,Ciudad de Mexico
Carlos Lopez,19,Santiago
Laura Martinez,51,Bogota
Javier Perez,36,Lima
Sofia Gomez,22,Montevideo
Diego Sanchez,60,Quito
Valentina Torres,29,Caracas
Miguel Romero,41,Asuncion
;
RUN;

PROC PRINT DATA=ventas_csv(OBS=5);
RUN;
