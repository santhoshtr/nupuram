input glyph;
beginglyph;
z0 =(u, m/3.5);
z1 =(x0 + mw/4, y0 + m/4);
z2=(x1 + mw/4, y1 - m/4);
z3=(x2 - mw/4, y2 - m/4);
z4=(x3 - mw/3, y3 + m/2.5);
z5=(x4 + mw/2.8, y4 + m/2);
z6=(x5 + mw/2.4, y5-m/2);
z7=(x6, y6 - m/3);
% Second arch
z11 = z6;
z12 = (x11 + mw/4, y11 + m/2.5);
z13 = (x12 + mw/4, y12 - m/3);
z14 = (x13, y13 - m/2.5);
% third arch
z15=z13;
z16=(x15 + mw/2, y15 + m/2); % Top of third arch
z17=(x16 + m/3, y16 - m/2);
z18=(x17 - m/3, y17 - m/2);
z19= ( x18 - mw/4, y18 + .3m);
z20= ( x19 + mw/2, y19 +  m/3);
z21= ( x20 + m/3, y20 - m/3 );
z22= ( x21 - 0.7mw, y21 - m/2 );

paths[0] = z0{up}..z1{right}..z2{down}..z3{left}..z4.. z5..z6 ---z7;
paths[1] = z11{up}..z12..z13---z14;
paths[2] = z15{up}..z16..z17...z18..z19..z20..z21..z22;
pen_stroke(
    nib(thicknib rotated 0 )(1,3, 5 )
    nib(thinnib rotated 0 )(0, 2, 4, 6)
    nib(terminalnib rotated 135)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2, 4, 6)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 60)(infinity)
)(paths[2])(strokes[2]);
endglyph;
