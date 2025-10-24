/* IMPORTACION DE ARCHIVOS TXT */
PROC IMPORT DATAFILE="/workspaces/sas/CLASE 1/datos.txt"
    OUT=ventas
    DBMS=dlm
    REPLACE;
    GETNAMES = YES;
RUN;

PROC PRINT DATA=ventas(OBS=5);
RUN;