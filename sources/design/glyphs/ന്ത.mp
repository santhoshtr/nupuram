input glyph;
beginglyph;

z0=(m/3+.5thick, 0);
z1=(x0 - m/3, y0 + m/2);
z2=(x1 + m/3, y1 + m/2);
z3=(x2 + m/3, y2 - m/2);
z4=(x3, y3 - m/3); % bottom of piller
z5=(x3, y3);
z6=(x5 + m/3, y5 + m/2); % Top of second arch
z7=(x6 + m/3, y6 - m/2);
z8=(x7 - m/3, y7 - m/2);

paths[0] = z0..z1.. z2.. z3---z4 ;


pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 0)(4 )
)(paths[0])(strokes[0]);

z11 = z3;
z12 = ( x11 + m/2.4, y11 + m/2.5); % top
z13 = ( x12 + m/3, y12 - m/2);
z14 = ( x13 - mw/4, y13 - m/3); % bottom middle
z15 = ( x14 - mw/4, y14 + m/2.5);
z16 = ( x15 + mw/2, y15 + m/2); % second top
z17 = ( x16 + m/2.5, y16 - m/2);
z18 = ( x17 - m/3, y0);

paths[1] =z11{up}..z12{right}.. z13..z14..z15 ..z16{right}..z17..z18;

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2, 4, 6, 8)
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

endglyph;
