input glyph;
beginglyph;

z0 = (0, X);
z1=(x0 + 0.3sw, y0 - s/4);
z2=(x1 + 0.3sw, y1 + s/4);

paths[0] = z0{down}..{right}z1..{up}z2;
paths[0] := paths[0] shifted (-x1, 0);

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor( "top", (xpart(point 1 of paths[0]), X) );
endglyph;
