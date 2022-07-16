input glyph;
beginglyph;
soften:=0;
z0=(1.5u, m/3);
z1=(x0 + m/2, m/2);
z2=(x1 - m/3, y0 + 0.667m);
z3=(x2 - m/3, y0);
z4=(x3, 0);
z5=(x4 + m, y4);
z6=(x5, y5 + m*0.5);
z7=(x6, y6 + m*0.5);

paths[0] = z0{right}..z1..{left}z2..z3{dir 280}..{dir 240}z4{dir 30}..{dir 30}z5{dir 30}..z6...{dir 60}z7;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3, 6)
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 150)(infinity) % Sharp cut
)(paths[0])(strokes[0]);


z10=(m/3,  0);
z11=(x10 + m/4, y10 - 0.25m);
z12=(x11 - m/4, y11 - 0.25m);
z13=(x12 - m/4, y12 + 0.25m);
z14=(x13 + m/4, y13 + 0.25m);
z15=(x14 + 0.3m, y14 - 0.25m);
z16=(x15 + 0.3m, y15 - 0.25m);
z17=(x16 + m/4, y16 + 0.25m);
z18=(x17 - m/4, y17 + 0.25m);
paths[1] = z10...z11{down}...z12{left}..{up}z13..z14..z15..z16..z17..z18 ;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2,4 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 1, 3,   5, 7)
    nib(default_nib xyscaled(1, terminalround) rotated 30 )(infinity)
)(paths[1])(strokes[1]);

endglyph;