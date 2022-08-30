input glyph;
beginglyph;
z3=(mw/3, 0);
z4=(x3 - mw/3, y3 + m/2);
z5=(x4 + mw/3, y4 + 0.4m);
z6=(x5 + mw/3, y5 - m/2);
z7=(x6, y6 - m/3);
% Second arch
z11 = z6;
z12 = (x11 + mw/4, y11 + m/3);
z13 = (x12 + mw/4, y12 - m/3);
z14 = (x13, y13 - m/3);
z15= (x13,y13);
z16= (x15 + mw/2, m);
z17= (x16 + mw/3, y16 - m/2);
z18= (x17 - mw/3, y17 - m/2);
z19= ( x18 - mw/4, y18 + m/3);
z20= ( x19 + mw/2, y19 +  m/3);
z21= ( x20 + mw/3, y19);
z22= ( x21 - 0.7mw, -descent );

paths[0] =  z3{dir 150} ..z4.. z5..z6 ---z7;
paths[1] = z11{up}..z12..z13---z14;
paths[2] = z15{up}..z16..z17...z18..z19..z20..z21..{dir 150}z22;
paths[2] := paths[2] slanted tand(8) shifted (-tand(8)*mw/3, 0);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2,4,6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2,4, 6)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
anchor( "vc", (xpart(point 1 of paths[1]),0));
endglyph;
