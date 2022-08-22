input glyph;
beginglyph;

z0=(x1 + 0.3mw, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/2, y1 + m/2);
z3=(x2 + mw/2, y2 - m/2);
z4=(x3 - 0.3mw, y3 - m/2);
z5=(x4 - mw/5, y4 + m/2);
z6=(x5 + 3/4mw, y5 + m/2);
z7=(x6 + mw/4, y6 - m/4);
z8=(x7 - mw/4, y7 - m/4);

paths[0] = z0..z1..z2..z3..z4..{dir 60}z5;
paths[0] := paths[0]{dir 60}..subpath(2, 6) of da shifted(xpart(point 2.5 of paths[0]),0);

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4)
    nib(thinnib rotated 0 )(1, 3, 5,7, 9)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 8 of paths[0])(8)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
