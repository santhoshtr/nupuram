input glyph;
beginglyph;

z0=(x1 + 0.3mw, 0);
z1=(mw/3, y0 + m/2);
z2=(x1 + mw/2, y1 + m/2);
z3=(x2 + mw/2, y2 - m/2);
z4=(x3 - 0.3mw, y3 - m/2);
z5=(x4 - mw/5, y4 + m/2);

paths[0] = z0..z1..z2..z3..z4..{dir 60}z5;
paths[0] := paths[0]{dir 60}..subpath(2, 4) of da shifted(xpart(point 2.5 of paths[0]),0);
clearxy;
z0=(xpart(point infinity of paths[0]) + 0.4mw, ypart(point 5 of paths[0]) - m/2);
z1=(x0 - mw/2, -descent*1.2);
z2=(x1 - 0.6mw, y1);
z3=(xpart(point 1 of paths[0]) - mw/3, m/3);
z4=(x3 + mw/6, m);
paths[0] := paths[0]{right}..z0 ..{dir 190}z1..{dir 170}z2..z3..z4;

pen_stroke(
    nib(thicknib)(0, 2, 4, 6, 8)
    nib(thinnib)(1, 3, 5, 7, 9, 12)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 8 of paths[0])(8)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
