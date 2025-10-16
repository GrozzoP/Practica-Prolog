% Base de conocimientos
entrada(paella).
entrada(gazpacho).
entrada(consome).

carne('filete de cerdo').
carne('pollo asado').

pescado(trucha).
pescado(bacalao).

postre(flan).
postre(helado).
postre(pastel).

% ¿Cuáles son los menús que ofrece el restaurante?
combinacion_menu(Entrada, Principal, Postre) :-
    entrada(Entrada),
    (carne(Principal) ; pescado(Principal)),
    postre(Postre).

% ¿Cuáles son los menús que tienen consomé en las entradas? (menu_con_consomé/3). ¿Sería mejor esta regla con 2 parámetros?
menu_con_consome(Principal, Postre) :-
    combinacion_menu('consome', Principal, Postre).

% ¿Cuáles son los menús que no contienen flan como postre? (menu_sin_flan/3)
menu_sin_flan(Entrada, Principal, Postre) :-
    combinacion_menu(Entrada, Principal, Postre),
    Postre \= flan.

% ¿Cuáles son los menús que tienen carne como plato principal? (menu_con_carne/3)
menu_con_carne(Entrada, Principal, Postre) :-
    entrada(Entrada),
    carne(Principal),
    postre(Postre).

% Completar el programa menú de manera que una comida esté formada también por la elección de una bebida, a elegir entre vino, cerveza o agua mineral

bebida(vino).
bebida(cerveza).
bebida('agua mineral').

menu_completo(Entrada, Principal, Postre, Bebida) :-
    combinacion_menu(Entrada, Principal, Postre),
    bebida(Bebida).