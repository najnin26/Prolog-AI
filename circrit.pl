and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).

not(0,1).
not(1,0).

nand(0,0,1).
nand(0,1,1).
nand(1,0,1).
nand(1,1,0).

nor(0,0,1).
nor(0,1,0).
nor(1,0,0).
nor(1,1,0).

xor(0,0,0).
xor(0,1,1).
xor(1,0,1).
xor(1,1,0).

xnor(0,0,1).
xnor(0,1,0).
xnor(1,0,0).
xnor(1,1,1).

% Following is the truth tables of OR GATE for 4 inputs A ,B ,C and D.
% (Used in 8X3 Encoder)

or4(0,0,0,0,0).
or4(0,0,0,1,1).
or4(0,0,1,0,1).
or4(0,0,1,1,1).
or4(0,1,0,0,1).
or4(0,1,0,1,1).
or4(0,1,1,0,1).
or4(0,1,1,1,1).
or4(1,0,0,0,1).
or4(1,0,0,1,1).
or4(1,0,1,0,1).
or4(1,0,1,1,1).
or4(1,1,0,0,1).
or4(1,1,0,1,1).
or4(1,1,1,0,1).
or4(1,1,1,1,1).

% HALF ADDER :-
% INPUT VARIABLES - A,B,C
% OUTPUT VARIABLES - S ,Ca(Sum and Carry)

half_adder(A,B,S,Ca):-
    xor(A,B,S),
    and(A,B,Ca).

%FULL ADDER :-
%INPUT VARIABLES - A,B,C
%OUTPUT VARIABLES - S ,Ca (Sum and Carry)

full_adder(A,B,C,S,Ca):-
     xor(A,B,T1),
    xor(C,T1,S),
    and(T1,C,T2),
    and(A,B,T3),
    or(T3,T2,Ca).

%HALF SUBTRACTOR :-
%INPUT VARIABLES - A,B
%OUTPUT VARIABLES - D ,BO (Difference and borrow)

half_sub(A,B,D,BO):-
    xor(A,B,D),
    not(A,T1),
    and(B,T1,BO).

% FULL SUBTRACTOR :-
% INPUT VARIABLES - A,B
% OUTPUT VARIABLES - D ,BO (Difference and borrow)

full_sub(A,B,BI,D,BO) :-
    xor(A,B,T1),
    xor(T1,BI,D),
    not(T1,T2),
    not(A,T3),
    nand(T2,BI,T4),
    nand(T3,B,T5),
    nand(T4,T5,BO).

% 2 X 4 DECODER
% INPUT VARIABLES - A,B
% OUTPUT VARIABLES - D0,D1,D2,D3

decoder_2x4(A,B,D0,D1,D2,D3):-
    not(A,A_0),
    not(B,B_0),
    and(A_0,B_0,D0),
    and(A_0,B,D1),
    and(A,B_0,D2),
    and(A,B,D3).

% 3 X 8 ENCODER
% OUTPUT VARIABLES - A,B
% INPUT VARIABLES - D0,D1,D2,D3,D4,D5,D6,D7

encoder_8x3(_,D1,D2,D3,D4,D5,D6,D7,A,B,C):-
    or4(D1,D3,D5,D7,A),
    or4(D2,D3,D6,D7,B),
    or4(D4,D5,D6,D7,C).

% 2 X 1 MULTIPLEXER
% INPUT VARIABLES - A,B,S (Selector)
% OUTPUT VARIABLES - Z

mux_2x1(A,B,S,Z):-
    not(S,S1),
    and(A,S1,I0),
    and(B,S,I1),
    or(I0,I1,Z).

% 1 X 2 DEMULTIPLEXER
% INPUT VARIABLES - I (Input) ,S (Selector)
% OUTPUT VARIABLES - A,B

demux_1x2(I,S,A,B):-
    not(S,S_0),
    and(I,S_0,A),
    and(I,S,B).

% 1 X 4 DEMULTIPLEXER
% INPUT VARIABLES - I (Input) ,S0 and S1(Selectors)
% OUTPUT VARIABLES - A,B,C,D

demux_1x4(I,S0,S1,A,B,C,D):-
    decoder_2x4(S0,S1,T0,T1,T2,T3),
    and(I,T0,A),
    and(I,T1,B),
    and(I,T2,C),
    and(I,T3,D).

% D FLIP FLOP TRUTH TABLE

dff(0,0,1).
dff(1,1,0).

% CIRCUITS

circuit1(A,B,C,Q,R):-
    not(A,T1),
    and(A,B,T2),
    nand(T1,T2,T3),
    xnor(T3,C,T4),
    dff(T4,Q,R).
