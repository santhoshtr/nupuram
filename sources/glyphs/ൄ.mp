input glyph;
beginglyph;

z0=(0, m);
z1=(x0 + 0.3mw, 0.9m);
z2=(x1, 0.5m);
z3=(x2, 0);
z10=z3;
z11=(x10 + 0.2mw, y10 - 0.25m);
z12=(x11 - 0.2mw, y11 - 0.25m);
z13=(x12 - 0.2mw, y12 + 0.25m);
z14=(x13 + 0.2mw, y13 + 0.25m);
paths[0] = z0 ..z1..  z2..z3;
paths[1] = z10...z11{down}...z12{left}..{up}z13...z14  ;
pen_stroke(
    nib(thicknib rotated 0 )(0 )
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(0, 1, 3, 4)
)(paths[1])(strokes[1]);
endglyph;
