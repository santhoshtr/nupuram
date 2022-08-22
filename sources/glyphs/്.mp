input glyph;
beginglyph;

z0 = (0, m + m/3+thick/2);
z1=(x0 + 0.3mw, y0 - m/3);
z2=(x1 + 0.3mw, y1 + m/3);

paths[0] = z0{down}..{right}z1..{up}z2;
paths[0] := paths[0] shifted (-x1, 0);
rbearing:= -x1 - thick;

pen_stroke(
    nib(thicknib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
