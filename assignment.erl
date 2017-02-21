-module(assignment).
-export([perimeter/1, area/1, bits_direct/1, bits/1, enclose/1]).

%Shape = {Name_as_atom, Dimensions}.


%Define a function perimeter/1 which takes a shape and returns the perimeter of the shape.
%Choose a suitable representation of triangles, and augment area/1 and perimeter/1 to handle this case too.

perimeter({rectangle, {Width, Height}}) -> Width * 2 + Height * 2;
perimeter({triangle, {A, B, C}}) -> A + B + C; 
perimeter({circle, {Radius}}) -> math:pi() * 2 * Radius. 

area({triangle, {Base, Height, _}}) ->
    (Base * Height) / 2;
area({rectangle, {Width, Height}}) ->
    Width * Height;
area({circle, {Radius}}) ->
    math:pi() * Radius * Radius.

%Define a function enclose/1 that takes a shape an returns the smallest enclosing rectangle of the shape.

enclose({triangle, {Base, Height, _}}) ->
    {rectangle, {Base, Height}};
enclose({rectangle, {Width, Height}}) ->
    {rectangle, {Width, Height}};
enclose({circle, {Radius}}) ->
    {rectangle, {Radius*2, Radius*2}}.


%Define a function bits/1 that takes a positive integer N and returns the sum of the bits in the binary representation. For example bits(7) is 3 and bits(8) is 1.
%See whether you can make both a direct recursive and a tail recursive definition.

bits_direct(0) -> 0;
bits_direct(N) when N rem 2 == 0 ->
    bits_direct(N div 2);
bits_direct(N) when N rem 2 == 1 ->
    1 + bits_direct(N div 2).

bits(N) ->
    bits_tail(N, 0).
bits_tail(0, Acc) ->
    Acc;
bits_tail(N, Acc) -> bits_tail(N div 2, Acc + (N rem 2)).
		   
