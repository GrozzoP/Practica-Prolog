:- use_module(library(clpfd)).

% Base de conocimientos de una agencia de viajes
transporte(roma, 20).
transporte(londres, 30).
transporte(tunez, 10).

alojamiento(roma, hotel, 50).
alojamiento(roma, hostal, 30).
alojamiento(roma, camping, 10).
alojamiento(londres, hotel, 60).
alojamiento(londres, hostal, 40).
alojamiento(londres, camping, 20).
alojamiento(tunez, hotel, 40).
alojamiento(tunez, hostal, 20).
alojamiento(tunez, camping, 5).

% Crear la regla viaje/4 tal que se cumpla que: "el viaje a una Ciudad durante S semanas con un Hospedaje valido con un Precio total"
viaje(Ciudad, Semanas, Hospedaje, PrecioTotal) :-
    transporte(Ciudad, CostoTransporte),
    alojamiento(Ciudad, Hospedaje, CostoAlojamiento),
    % (Opcional) Utilizando el predicado var/1, intentar definir el precio si Semanas esta definido, sino dejar la expresion planteada.
    (var(Semanas) -> PrecioTotal = CostoTransporte + CostoAlojamiento * Semanas ;
    PrecioTotal is CostoTransporte + CostoAlojamiento * Semanas).

% Completar con viajeeconomico/5, agregando un parámetro extra que defina el Precio maximo del viaje
viajeeconomico(Ciudad, Semanas, Hospedaje, PrecioTotal, PrecioMaximo) :-
    viaje(Ciudad, Semanas, Hospedaje, PrecioTotal),
    PrecioTotal =< PrecioMaximo.

% (Opcional) Utilizando el modulo clpfd :- use_module(library(clpfd))., reemplazar el is/2 del punto 1 por el operador #=/2
% Si le damos todos los datos, nos da el resultado de manera correcta
% Si no pasamos la cantidad de semanas y el precio total, nos otoroga la estructura sin realizar las operaciones matemáticas
% Si le pasamos el precio total y no las semanas, nos predice la cantidad de semanas en base a toda la información brindada
% Si la anterior predicción no tiene una respuesta concreta, deja planteada la estructura con las variables involucradas
viaje_clpfd(Ciudad, Semanas, Hospedaje, PrecioTotal) :-
    transporte(Ciudad, CostoTransporte),
    alojamiento(Ciudad, Hospedaje, CostoAlojamiento),
    PrecioTotal #= CostoTransporte + CostoAlojamiento * Semanas.