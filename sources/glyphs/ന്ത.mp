input glyph;
beginglyph;

z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3, y3 - m/4); % bottom of piller

paths[0] = z0..z1.. z2.. z3---z4 ;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

z11 = z3;
z12 = ( x11 + mw/2.4, m-thick/2); % top
z13 = ( x12 + mw/3, y12 - m/2);
z14 = ( x13 - mw/4, thick/2); % bottom middle
z15 = ( x14 - mw/4, y14 + m/2.5);
z16 = ( x15 + mw/2, m ); % second top
z17 = ( x16 + mw/2.5, y16 - m/2);
z18 = ( x17 - mw/4, y0);

paths[1] =z11{up}..z12{dir 10}.. z13..z14..z15 ..z16{dir 10}..z17..{dir 220}z18;

pen_stroke(
    nib(thinnib rotated 0 )(2, 4, 6, 8)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", point 0 of paths[1]);
anchor( "bottom", point 6 of paths[1]);
anchor( "right", point 6 of paths[1]);

endglyph;
