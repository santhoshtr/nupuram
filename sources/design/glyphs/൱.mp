input glyph;
beginglyph;

z0= (.5thick, -thick/2);
z1=(x0 , y0 + 0.5m);
z2=(x0, y1 + 0.5m);
z3=(x2 + mw/2 , y2 - 0.4m);
z4=(x3 , thick/2);

paths[0] = z0  ..z1 .. z2 .. z3{down}...z4;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3,5)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 0)(4 )
)(paths[0])(strokes[0]);


z5=z3;
z6=(x5 + mw/4, y5+mw/2);
z7=(x6 + mw/3, y6-mw/2);
z8=(x7 - mw/2, y7-0.8mw);

paths[1] = z5{up}..z6..z7..z8;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2)
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 135)(3 )
)(paths[1])(strokes[1]);

endglyph;
