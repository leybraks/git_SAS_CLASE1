/* Adapted from CLASE 1/concatenaciones.sas. The original PROC IMPORTs
   datos.csv and datos.txt separately, then concatenates them with SET;
   since this bundle ships no data files, both source datasets are seeded
   inline (same rows as datos.csv / datos.txt) and the concatenation step
   is unchanged from the source. */
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
;
RUN;

DATA ventas;
    LENGTH nombre $30 ciudad $20;
    INPUT nombre $ edad ciudad $;
    DATALINES;
Ana 28 Madrid
Luis 45 BuenosAires
Maria 32 CiudadDeMexico
Carlos 19 Santiago
Laura 51 Lima
;
RUN;

DATA total;
    LENGTH nombre $50 ciudad $40;
    SET ventas ventas_csv;
RUN;

PROC PRINT DATA= total(obs=5);
RUN;
