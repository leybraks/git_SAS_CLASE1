PROC IMPORT DATAFILE="/workspaces/sas/CLASE 1/carreras.xlsx"
    OUT=carreras
    DBMS=XLSX
    REPLACE;
    GETNAMES = YES;
RUN;

PROC IMPORT DATAFILE="/workspaces/sas/CLASE 1/datos.csv"
    OUT=ventas_csv
    DBMS=CSV
    REPLACE;
    GETNAMES = YES;
RUN;

PROC IMPORT DATAFILE="/workspaces/sas/CLASE 1/datos.txt"
    OUT=ventas
    DBMS=dlm
    REPLACE;
    GETNAMES = YES;
RUN;

PROC SORT DATA= carreras; BY nombre; RUN;
PROC SORT DATA= ventas; BY nombre; RUN;

DATA ventas_completa;
    LENGTH nombre $50 ciudad $40;
    MERGE ventas (IN=a) carreras (IN=b);
    BY nombre;
    IF a AND b;
RUN;

PROC PRINT DATA=ventas_completa(OBS=5)