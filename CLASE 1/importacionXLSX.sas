PROC IMPORT DATAFILE="/workspaces/sas/CLASE 1/carreras.xlsx"
    OUT=carreras
    DBMS=XLSX
    REPLACE;
    GETNAMES = YES;
RUN;

PROC PRINT DATA=carreras;
RUN;