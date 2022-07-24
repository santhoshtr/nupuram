input glyph;
beginglyph;
z0=(mw/3 + 0.5thick, 0);
z1=(x0 - mw/3, y0 + m/2);
z2=(x1 + mw/3, y1 + m/2);
z3=(x2 + mw/3, y2 - m/2);
z4=(x3, y3 - m/3); % bottom of piller
z5=(x3, y3);
z6=(x5 + mw/5, y5 + m/3);
z7=(x6 + mw/5, y6 - m/3);
z8=(x7 + mw/5, y7 - m/2);
z9=(x8 + mw/3, y8 + m/2);
z10=(x9 - mw/3, y9 + m/2);

paths[0] = z0..z1.. z2.. z3---z4 ;
paths[1] =  z5{up}..z6 ..z7...z8..z9 .. z10;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 0)(4 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3, 5, 7)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2, 4)
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(infinity)
)(paths[1])(strokes[1]);


anchor( "vc", (x3,0));
anchor( "bottom", (x9,0));
anchor( "right", (x9,0));

endglyph;
