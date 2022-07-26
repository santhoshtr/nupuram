input glyph;
beginglyph;
z0=(mw/3 + 0.5thick, 0);
z1=(x0 - mw/3, y0 + m/2);
z2=(x1 + mw/3, y1 + m/2);
z3=(x2 + mw/3, y2 - m/2);
z4=(x3, y3 - m/3); % bottom of piller
z5=(x3, y3);
z6=(x5 + mw/5, y5 + m/3);
z7=(x6 + mw/5, y6 - m/3);
z8=(x7 + mw/5, y7 - m/2);
z9=(x8 + mw/3, y8 + m/2);
z10=(x9 - mw/3, y9 + m/2);

paths[0] = z0..z1.. z2.. z3---z4 ;
paths[1] =  z5{up}..z6 ..z7...z8..z9 .. z10;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 0)(4 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(2, 4)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 45)(infinity)
)(paths[1])(strokes[1]);

z12=(x9, y8);
z13=(x9 + mw, y8);
z14=(x13, y13 + m*0.5);
z15=(x14 - mw/3, y14 + m/2);
z16=(x15 - mw/3, y15 - m/2);
z17=(x16, y8 );

paths[2] = z12{dir 20}..  z13..z14 .. z15..z16..{dir -85}z17;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 3, 5 )
    nib(thinnib rotated 0 )( 2,4)
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 30)(infinity)
)(paths[2])(strokes[2]);

endglyph;
