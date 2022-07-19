input glyph;

beginglyph;

soften := 0;
z0 = (m/2+ thick/2, m- m/3);
z1 = (x0 + mw/4, y0 + m/3);
z2 = (x1 + mw/4, y1 - m/2);
z3 = (x2 - 0.4mw, 0);
z4 = (x3 - 0.6mw, y3 + 0.45m);
z5 = (x4 + mw/4, y4 + 0.4m);
z6 = (x0, y0);
z7 = (x6 + m/6, y6 - m/2);
z8 = (x7 + mw/2, y3);
z9 = (x8 + mw/4, y8+ m/2);
z10 = (x9 - mw/4, y9 + m/2);
paths[0] = z0{up} ..z1..z2..z3..z4..z5..z6..z7..z8..z9.. z10;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1,3,5,8 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0,2,4,6, 7, 9)
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

% Shoe
z11 = z9;
z12 = (x11, y11-m/2);
z13 = (x12, y12 - m/3 );
z14 = (x13 - mw/2, y13);
z15 = (x8, y8);
paths[1] = z11{dir -60}..z12..z13{left}..{left}z14{dir 30}.. z15;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(  3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,2)
    nib(default_nib xyscaled(1,terminalround) rotated 120)(3) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(thin,terminalround) rotated 170)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

endglyph;

