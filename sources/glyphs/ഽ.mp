% Avagraha
input glyph;
beginglyph;

z0 = (x1+mw/4, m);
z1 = ((x0+x2)/2, ascent);
z2 = (mw/2, (y1+y3)/2);
z3 = (x2, 0);
z4 = ((x3+x5)/2, -descent);
z5 = (0, y3);
paths[0] = z0{dir 100}..z1..z2{down}..z4..{dir 100}z5;
paths[0] := paths[0] slanted tand(6);

pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
endglyph;
