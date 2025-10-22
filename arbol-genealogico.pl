hombre(pedro).
hombre(manuel).
hombre(arturo).
mujer(maria).
padre(pedro, manuel).
padre(pedro, arturo).
padre(pedro, maria).

% expresa que X es hijo o hija de Y.
nino(X, Y) :- (hombre(X) ; mujer(X)), padre(Y, X).

% expresa que X es una hija de Y.
hija(X, Y) :- mujer(X), padre(Y, X).

% expresa que X es hermano o hermana de Y.
hermano-o-hermana(X, Y) :- (hombre(X) ; mujer(X)), padre(Padre, X), padre(Padre, Y).

% expresa que X es un hermano de Y.
hermano(X, Y) :- hombre(X), padre(Padre, X), padre(Padre, Y).

% expresa que X es una hermana de Y.
hermano(X, Y) :- mujer(X), padre(Padre, X), padre(Padre, Y).