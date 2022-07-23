input glyph;
beginglyph;

z0 = (mw/5+thick/2 , m);
z1 = (x0 + mw/5, y0 - m/4);
z2 = (x1 - mw/5, y1 - m/4);
z3 = (x2 - mw/5, y2 + m/4);
z4 = (x3 + mw/4, y3 + m/4);
z5 = (x4 + mw/2.4, y4 - m/3);
z6 = (x5, y5 - m/5);

z7 = (x5, y5); % Second arch
z8 = (x7 + mw/3, y7 + m/3  );
z9 = (x8 + mw/3, y8 - m/3);
z10 = (x9 - mw/2, y9 - m/3);
z11 = (x10 - mw/2, y10 - m/12);
z12 = (x11 - mw/3, y11 - m/4);

z15 = (x12 + mw, y12 + m/3);
z16 = (x15 + mw/3, y15 - m/4);
z17 = (x16 - mw/4, y16 - m/4);
z18 = (x17 - mw/4, y17 + m/3+ m/6);
paths[0] = z0  ..z1 ..   z2 .. z3   .. z4  .. z5---z6 ;
paths[1] = z7{dir 85}..z8 ..z9..z10.. z12;
paths[2] = z12.. tension 1.5..z15..z16..z17..z18;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,   3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3,5)
    nib(default_nib xyscaled(thin, terminalround) rotated 90 )(0 )
    nib(default_nib xyscaled(1, terminalround) rotated 0 )(infinity )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 4)
    nib(default_nib xyscaled(thin, thin) rotated 0 )( 2,3,4,5,7,9,11)
    nib(default_nib xyscaled(thin, terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick, terminalround) rotated 120)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 4)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 2)
    nib(default_nib xyscaled(xthick, terminalround) rotated 120)(0) % Sharp cut
    nib(default_nib xyscaled(thin, terminalround) rotated 0)(infinity) % Sharp cut
)(paths[2])(strokes[2]);

endglyph;
