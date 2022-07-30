input glyph;
beginglyph;

z0=(1.5u, m/2);
z1=(x0 + mw/2, y0+m/6);
z2=(x1 - mw/3, m);
z3=(x2 - mw/3, m/3);
z4=(x3 + mw/3, 0);
z5=(x4 + 2/3mw, y3);
z6=(x5 - mw/8, y2);


paths[0] = z0 ..z1.. z2..z3 .. z4 ..z5.. z6;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5 )
    nib(thinnib rotated 0 )(1,3, 5)
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 60)(infinity)
)(paths[0])(strokes[0]);

z10=(mw/3,  0);
z11=(x10 + 0.2mw, y10 - 0.25m);
z12=(x11 - 0.2mw, y11 - 0.25m);
z13=(x12 - 0.2mw, y12 + 0.25m);
z14=(x13 + 0.2mw, y13 + 0.25m);
z15=(x14 + 0.3mw, y14 - 0.25m);
z16=(x15 + 0.3mw, y15 - 0.25m);
z17=(x16 + 0.2mw, y16 + 0.25m);
z18=(x17 - 0.2mw, y17 + 0.25m);
paths[1] = z10...z11{down}...z12{left}..{up}z13..z14..z15..z16..z17..z18 ;
pen_stroke(
    nib(thicknib rotated 0 )(2,4 )
    nib(thinnib rotated 0 )(0, 1, 3,   5, 7)
    nib(terminalnib rotated 30 )(0)
    nib(terminalnib rotated 30 )(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", (x2,0));
anchor( "bottom", z17);
anchor( "right", z17);

endglyph;