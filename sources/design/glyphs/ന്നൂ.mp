input glyph;
beginglyph;
z3=(m/3+thick/2, 0);
z4=(x3 - m/3 , y3 + m/2);
z5=(x4 + m/3, y4 + m/2);
z6=(x5 + m/3, y5 - m/2);
z7=(x6, y6 - m/3);
% Second arch
z11 = z6;
z12 = (x11 + m/3, y11 + m/3);
z13 = (x12 + mw/4, y12 - m/3);
z14 = (x13 , y13 - m/3);
z15=z13;
z16=(x15 + mw/2, y15 + m/2);
z17=(x16 + m/3, y16 - m/2);
z18=(x17 - m/3, y17 - m/2);
z19= ( x18 - mw/4, y18 + .3m);
z20= ( x19 + mw/2, y19 +  m/3);
z21= ( x20 + m/3, y20 - m/3 );
z22= ( x21 - 0.7mw, y21 - m/2 );

paths[0] =  z3 ..z4.. z5..z6 ---z7;
paths[1] = z11{up}..z12..z13---z14;
paths[2] = z15{up}..z16..z17...z18..z19..z20..z21..z22;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2,4,6 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3)
    nib(default_nib xyscaled(thin, 1) rotated 0 )(2)
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2,4, 6)
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(infinity) % Sharp cut
)(paths[2])(strokes[2]);
endglyph;
