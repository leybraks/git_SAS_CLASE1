/*
DATA _null_;
    PUT "HOLA MUNDo"
RUN;
*/
DATA ejemplo;
    input nombre $ edad nota;
    datalines;
    Ana 20 15
    Juan 22 18
    Carla 21 17
    ;
    title alumnos;
RUN;

proc print data = ejemplo;
RUN;