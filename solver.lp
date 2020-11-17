% data sets
match(1, 1, 3, yellow).
match(1, 2, 2, purple).
match(2, 1, 1, red).
match(2, 3, 3, yellow).
match(3, 3, 2, red).
match(4, 3, 1, purple).

% target cell (row, col)
target(4, 2).

% elements
number(1..4).
color(blue).
color(red).
color(yellow).
color(purple).

% cells
row(1..4).
col(1..4).

% rules
1{match(Row, Col, Num, Color) : number(Num), color(Color)}1 :-
    row(Row),
    col(Col).

:-
    match(Row, Col1, Num, _),
    match(Row, Col2, Num, _),
    Col1 != Col2.

:-
    match(Row1, Col, Num, _),
    match(Row2, Col, Num, _),
    Row1 != Row2.

:-
    match(Row, Col1, _, Color),
    match(Row, Col2, _, Color),
    Col1 != Col2.

:-
    match(Row1, Col, _, Color),
    match(Row2, Col, _, Color),
    Row1 != Row2.

solver(number, Num, color, Color) :-
    target(Row, Col),
    match(Row, Col, Num, Color).

#show solver/4.