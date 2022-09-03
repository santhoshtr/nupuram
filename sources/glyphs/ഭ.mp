input glyph;
beginglyph;


paths[0] = subpath(0,2) of da;
z3 = ( xpart(point infinity of paths[0]) + mw/3, ypart(point infinity of paths[0]) - m/3);
z4= ( x3 - mw/3, m/2);
z5= ( x4 + mw/3, y4 - .2m);
z6 = ( x5 + mw/6, y5 - .15m);
z7 = ( xpart(point infinity of paths[0]) - mw/6, 0);

paths[0] := paths[0].. z3 ..z4  .. z5{right} ..z6..{dir 160}z7;

pen_stroke(
    nib(thinnib rotated 0 )(1, 3, 5, 6)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
