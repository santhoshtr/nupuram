input glyph;
beginglyph;

z0 = (0, y1 + m/4);
z1 = (x0 + mw/4, -descent-thick);
z2 = (x1 + mw/4, y0);
z3 = (x2 - mw/4, m/2);
z4 = (x3, m);

paths[0] = z0{down} ..  z1 ..  z2;
paths[0] := paths[0]..z3..z4;
paths[0] := paths[0] shifted(-x3,0);
pen_stroke(
    nib(thinnib rotated 0 )(2, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
