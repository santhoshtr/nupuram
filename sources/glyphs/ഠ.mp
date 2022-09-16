input glyph;
beginglyph;
z0=(0, m/2);
z1=(x0 + 0.4mw, y0 + m/2);
z2=(x1 + 0.4mw, y1 - m/2);
z3=(x2 - 0.4mw, y2 - m/2);
z4=z0;

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4;
paths[0] := paths[0] crotated -18;

pen_stroke(
    nib(thicknib rotated 0)(1, 3 )
    nib(thinnib rotated 0)(0, 2, 4)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor( "vc", (xpart(point 1 of paths[0]),0));
anchor( "bottom", (xpart(point 2.75 of paths[0]),0));
anchor( "right", (xpart(point 2.75 of paths[0]),0));
endglyph;
