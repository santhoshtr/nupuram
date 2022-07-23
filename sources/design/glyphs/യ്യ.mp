input glyph;

beginglyph;

z0 = (m/3-thick/2 , m - m/3);
z1 = (x0 + mw/3, y0 + m/3);
z2 = (x1 + mw/4, y1 - m/2);
z3 = (x2 - mw/2, 0);
z4 = (x3 - mw/3, y3 + m/4);
z5 = (x4 + mw/3, y4 + m/4);
z7 = (x5 + mw/3, y5 - m/4);
z8 = (x7 + mw/3, y3);
z9 = (x8 + mw/4, y8+ m/2);
z10 = (x9 - mw/4, y9 + m/2);
paths[0] = z0{up} ..z1..z2..z3..z4..z5 ..z7..z8..z9.. z10;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1,3,5,7 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2,4,6, 8)
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

% Shoe
z11 = (x9, y9 - m/3);
z12 = (x11, y11 - m/2 );
z13 = (x1, y12);
z14 = (x8, y8);
paths[1] = z11-- z12{left}..{left}z13{dir 45} .. z14;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1,2)
    nib(default_nib xyscaled(1,terminalround) rotated 120)(3) % Sharp cut
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

endglyph;

