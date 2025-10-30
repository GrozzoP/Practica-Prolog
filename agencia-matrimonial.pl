% Base de conocimimientos
hombre(juan, alto, castano, joven).
hombre(pedro, bajo, rubio, adulto).
mujer(ana, media, rubio, adulta).
mujer(luisa, alta, castano, joven).

gusta(juan, pop, aventura, tenis).
gusta(ana, pop, aventura, tenis).
gusta(luisa, jazz, ciencia_ficcion, natacion).

busca(juan, media, rubio, adulta).
busca(ana, alto, castano, joven).
busca(luisa, alto, castano, joven).

% Si conviene fisicamente
conviene_fisicamente(Hombre, Mujer) :-
    hombre(Hombre, HA, HC, HE),
    mujer(Mujer, MA, MC, ME),
    busca(Hombre, MA, MC, ME),
    busca(Mujer, HA, HC, HE).

% Si conviene por gustos
conviene_gustos(Hombre, Mujer) :-
    gusta(Hombre, HM, HG, HD),
    gusta(Mujer, HM, HG, HD).

% Si convienen
convienen(Hombre, Mujer) :-
    conviene_fisicamente(Hombre, Mujer),
    conviene_gustos(Hombre, Mujer).

% Adecuados entre si
adecuados(Hombre, Mujer) :-
    hombre(Hombre, _, _, _),
    mujer(Mujer, _, _, _),
    conviene(Hombre, Mujer),
    conviene(Mujer, Hombre).

adecuados(Mujer, Hombre) :-
    hombre(Hombre, _, _, _),
    mujer(Mujer, _, _, _),
    conviene(Hombre, Mujer),
    conviene(Mujer, Hombre).