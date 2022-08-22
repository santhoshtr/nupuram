input glyph;
beginglyph;
z0=(x1 + 0.3mw, 0);
z1=(0, y0 + 0.5m);
z2=(x1 + 0.5mw, y1 + 0.5m);
z3=(x2 + 0.5mw, y2 - 0.5m);
z4=(x3 - 0.3mw, y3 - 0.5m);
z5=(x4 - mw/4, y4 + m/3);

paths[0] = z0..z1..z2..z3..z4..{dir 80}z5;
z6 = point 2.75 of paths[0];
paths[0] := paths[0]..{right}z6 ;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4)
    nib(thinnib rotated 0 )(1, 3, 5, 6)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
