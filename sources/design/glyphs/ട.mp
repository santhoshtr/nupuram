input glyph;
beginglyph;
w:=0.8m;
z0=(0.8w+thick/2, 0.8m);
z1=(x0 - w/3, m);
z2=(thick/2, y1 - m/4);
z3=(x2 + w/2, m/2);
z4=(w-thick/4, y3 - m/4);
z5=(x4 - w/2, 0);
z6=(x2-thick/3, y5 + m/4);
paths[0] = z0..z1..z2 ..z3..z4..z5..z6 ;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,1, 3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2, 4)
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(0)
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(infinity )
)(paths[0])(strokes[0]);


anchor( "vc", (x1,0));
anchor( "bottom", (x4,0));
anchor( "right", (x4,0));

endglyph;
