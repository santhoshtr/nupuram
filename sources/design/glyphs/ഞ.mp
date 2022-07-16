input glyph;
beginglyph;

z0 =(u, m/3.5);
z1 =(x0 + mw/4, y0 + m/4);
z2=(x1 + mw/4, y1 - m/4);
z3=(x2 - mw/4, y2 - m/4);
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

z10 = z6;
z12 = ( x10 + m/3, y10 + m/2); % top
z13 = ( x12 + mw/2, y12 - m/2);
z14 = ( x13 - mw/4, y13 - m/3); % bottom middle
z15 = ( x14 - mw/4, y14 +  m/3);
z16 = ( x15 + mw/2, y15 +  m/2); % second top
z17 = ( x16 + m/2.5, y16-m/2);
z18 = ( x17 - m/3, y17-m/2); %

paths[1] = z10{up} ..z12{right}.. z13..z14..z15 ..z16{right}..z17..z18;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3, 5, 7, )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2, 4,6)
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

endglyph;
