% Base de conocimientos
disponibilidad_equipo(marketing, 9).
disponibilidad_equipo(marketing, 10).
disponibilidad_equipo(desarrollo, 10).
disponibilidad_equipo(desarrollo, 11).
disponibilidad_equipo(ventas, 9).
disponibilidad_equipo(ventas, 11).

disponibilidad_cliente(google, 9).
disponibilidad_cliente(google, 10).
disponibilidad_cliente(google, 11).
disponibilidad_cliente(apple, 10).
disponibilidad_cliente(apple, 11).
disponibilidad_cliente(microsoft, 9).
disponibilidad_cliente(microsoft, 11).

% Disponibilidad reunion
disponibilidad_reunion(Equipo, Cliente, Horario) :-
    disponibilidad_equipo(Equipo, Horario),
    disponibilidad_cliente(Cliente, Horario).

% Reservar un Horario
reunion_pactada(ventas, google, 11).
reunion_pactada(marketing, apple, 10).

disponibilidad_reunion_final(Equipo, Cliente, Horario) :-
    disponibilidad_reunion(Equipo, Cliente, Horario),
    \+ reunion_pactada(Equipo, _, Horario),
    \+ reunion_pactada(_, Equipo, Horario).