input glyph;
beginglyph;

z0=(0, m + m/4);
z1=(x0 + 0.6mw, y0);
z2=(x1, 0.6m);
z3=(x2, 0);

paths[0] =  z0{dir 45} .. z1.. z2 .. z3;
paths[0] := paths[0] shifted (-x1+thick/2, 0);

pen_stroke(
    nib(thinnib rotated 0 )(1, 2,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
