input glyph;
beginglyph;
soften:=0;
z0=(0.3mw, 0.8m);
z1=(x0 + 0.3mw, y0 - 0.4m);
z2=(x1 - 0.3mw, y1 - 0.4m);
z3=(x2 - 0.3mw, y2 + 0.4m);
z4=(x3 + 0.3mw, y3 + 0.4m);
z5=(x4 + 0.8mw, y0);

paths[0] = z0{right}..{down}z1..{left}z2..z3{up}..{right}z4..z5;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2)
    nib(default_nib xyscaled(thin,terminalround) rotated 90)(0 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3,4)
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity )
)(paths[0])(strokes[0]);
endglyph;
