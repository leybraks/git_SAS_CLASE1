PROC IMPORT DATAFILE="/workspaces/sas/CLASE 1/datos.csv"
    OUT=ventas_csv
    DBMS=CSV
    REPLACE;
    GETNAMES = YES;
RUN;

PROC PRINT DATA=ventas_csv(OBS=5);
RUN;

PROC IMPORT DATAFILE="/workspaces/sas/CLASE 1/datos.txt"
    OUT=ventas
    DBMS=dlm
    REPLACE;
    GETNAMES = YES;
RUN;

DATA total;
    SET ventas ventas_csv;
RUN;

PROC PRINT DATA= total(obs=5);
RUN;