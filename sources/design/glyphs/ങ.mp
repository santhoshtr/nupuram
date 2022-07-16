input glyph;
beginglyph;

z0 =(u, m/3.5);
z1 =(x0 + m/4, y0 + m/4);
z2=(x1 + m/4, y1 - m/4);
z3=(x2 - m/4, y2 - m/4);
z4=(x3 - m/3 , y3 + m/2.5);
z5=(x4 + m/2.8, y4 + m/2);
z6=(x5 + m/2.4, y5-m/2);
z7=(x6, y6 - m/3);

paths[0] = z0{up}..z1{right}..z2{down}..z3{left}..z4.. z5..z6 ---z7;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1,3, 5 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(0, 2, 4, 6)
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

z11 = z6;
z12 = ( x11 + m/4, y11 + m/2); % top
z13 = ( x12 + m/4, y12 - m/2); % <
z14 = ( x13 + m/3, y13 - m/6);
z15 = ( x14-m/3 , y14- m/6);

paths[1] = z11{up}..z12..{left}z13{right}..z14..z15;
pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )( 3,4)
    nib(default_nib xyscaled(1 ,terminalround) rotated 60)(2) % Sharp cut
    nib(default_nib xyscaled(thin ,terminalround) rotated 0)( 0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

endglyph;
