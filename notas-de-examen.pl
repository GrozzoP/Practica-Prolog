parcial1(ana,7).
parcial1(juan,4).
parcial1(julio, 2).
parcial1(maria, 10).
parcial1(fernando, 10).

parcial2(ana,9).
parcial2(juan,8).
parcial2(julio, 4).
parcial2(maria, 2).
parcial2(fernando, 10).

% El listado de los alumnos que promocionan la materia
promocionan(Alumno) :- 
    parcial1(Alumno, Nota1),
    parcial1(Alumno, Nota2),
    Nota1 >= 7,
    Nota2 >= 7.

% El mismo listado pero esta vez incluyendo la nota final (promedio de los dos parciales) para cada uno
promocionanConNotaFinal(Alumno, NotaFinal) :-
    parcial1(Alumno, Nota1),
    parcial2(Alumno, Nota2),
    Nota1 >= 7,
    Nota2 >= 7,
    NotaFinal is (Nota1 + Nota2) / 2.0.

% El listado de los alumnos que recursan la materia.
recursan(Alumno) :-
    parcial1(Alumno, Nota1),
    parcial2(Alumno, Nota2),
    (Nota1 < 4;
    Nota2 < 4).

% El listado de los alumnos que obtendrán la cursada.
cursada(Alumno) :-
    parcial1(Alumno, Nota1),
    parcial2(Alumno, Nota2),
    ((Nota1 >= 4, Nota1 < 7) ;
    (Nota2 >= 4, Nota2 < 7)).

% (maximos) A fin de entregar la medalla al merito, encontrar de aquellos que promocionan (1b), el o los alumnos con mayor nota final (nombre y nota)
medalla_merito(Alumno, NotaFinal) :-
    promocionanConNotaFinal(Alumno, NotaFinal),
    \+ (promocionanConNotaFinal(_, OtraNota), OtraNota > NotaFinal).

/* (maximos) Ahora se desea obtener cuales fueron las dos notas mas altas, considerando simplemente a la nota como el promedio de la nota de parcial1 y parcial2. Solo interesan los números. Un tip es pensar la resolución en dos etapas, la mas alta, y después la mas alta de lo restante */
promedios(NotaFinal) :-
    parcial1(Alumno, Nota1),
    parcial2(Alumno, Nota2),
    NotaFinal is (Nota1 + Nota2) / 2.0.

dos_notas_mas_altas(Nota1, Nota2) :-
    promedios(Nota1),
    promedios(Nota2),
    Nota1 > Nota2,
    \+ (promedios(Otra), Otra > Nota1),
    \+ (promedios(Otra), Otra > Nota2, Otra < Nota1).