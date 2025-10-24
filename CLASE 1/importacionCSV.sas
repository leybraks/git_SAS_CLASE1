PROC IMPORT DATAFILE="/workspaces/sas/CLASE 1/datos.csv"
    OUT=ventas_csv
    DBMS=CSV
    REPLACE;
    GETNAMES = YES;
RUN;

PROC PRINT DATA=ventas_csv(OBS=5);
RUN;