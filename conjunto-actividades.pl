% Base de conocimimientos
natacion(a).
natacion(b).
natacion(c).
natacion(d).

futbol(a).
futbol(b).
futbol(e).
futbol(f).

teatro(a).
teatro(c).
teatro(e).
teatro(g).

% Qué estudiantes participan de todas las actividades
participan_todas_actividades(Persona) :-
    natacion(Persona),
    futbol(Persona),
    teatro(Persona).

% Qué estudiantes realizan futbol y no teatro
futbol_no_teatro(Persona) :-
    futbol(Persona),
    \+ teatro(Persona).

% Qué estudiantes realizan al menos alguna actividad. Evitar duplicados
alguna_actividad(L) :-
    setof(E, (natacion(E); futbol(E); teatro(E)), L).

% Qué estudiantes participan de al menos dos actividades
al_menos_dos_actividades(Persona) :-
    (natacion(Persona), futbol(Persona));
    (natacion(Persona), teatro(Persona));
    (futbol(Persona), teatro(Persona)).

al_menos_dos_actividades_SD(L) :-
    setof(P, al_menos_dos_actividades(P), L).

/* Teniendo un listado de estudiantes total estudiantes/1 comprendido entre [a, j], qué estudiantes no realizan ninguna   actividad */
estudiantes([a,b,c,d,e,f,g,h,i,j]).

sin_actividad(Persona) :-
    estudiantes(Lista),
    member(Persona, Lista),
    \+ natacion(Persona),
    \+ futbol(Persona),
    \+ teatro(Persona).
