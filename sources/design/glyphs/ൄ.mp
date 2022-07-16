input glyph;
beginglyph;

z0=(0 , m);
z1=(x0 + 0.3m , 0.9m);
z2=(x1 , 0.5m);
z3=(x2 , 0);
z10=z3;
z11=(x10 + 0.2mw, y10 - 0.25m);
z12=(x11 - 0.2mw, y11 - 0.25m);
z13=(x12 - 0.2mw, y12 + 0.25m);
z14=(x13 + 0.2mw, y13 + 0.25m);
paths[0] = z0 ..z1..  z2..z3;
paths[1] = z10...z11{down}...z12{left}..{up}z13...z14  ;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1, 2)
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 1, 3, 4)
)(paths[1])(strokes[1]);
endglyph;
