input glyph;
beginglyph;
w:=0.8m;
z0=(w, 0.8m);
z1=(x0 - w/2, y0 + 0.2m);
z2=(x1 - w/3, y1 - 0.3m);
z3=(x2 + w/2, y2 - 0.2m);
z4=(x3 + w/3, y3 - 0.2m);
z5=(x4 - w/2, y4 - 0.25m);
z6=(x5 - w/4, y5 + 0.2m);

z10 = z5;
z11 = (x10+w/2, y10 - m/4);
z12 = (x11-w/2, y11 - m/4);
z13 = (x12-w/3, y12 + m/3);

paths[0] = z0..z1..z2 ..z3..z4..z5..z6 ;
paths[1] = z10{dir -10}..z11..z12 ..z13 ;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,1, 3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2, 4)
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(0)
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(infinity )
)(paths[0])(strokes[0]);

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(1,terminalround) rotated 60)(0)
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(infinity )
)(paths[1])(strokes[1]);

endglyph;
