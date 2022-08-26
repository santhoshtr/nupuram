input glyph;
beginglyph;
z0 = (mw/3 + 0.5thick, 0);
z1 = ( x0 - mw/3, y0 + m/2); % leftmost
z2 = ( x1 + mw/2.5, y1 + m/2); % top
z3 = ( x2 + mw/2, y2 - m/2);
z4 = ( x3 - mw/4, y3 - m/3); % bottom middle
z5 = ( x4 - mw/4, y4+ m/3);
z6 = ( x5 + mw/2, y2); % second top
z7 = ( x6 + mw/2.5, y1);
z8 = ( x7 - mw/3, y0); %
paths[0] = z0  ..z1..z2{right}.. z3..z4..z5 ..z6{right}..z7..z8;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6, )
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

z12=z8;
z13=(x8 + mw, y8);
z14=(x13+0.2mw, y13 + m/2);
z15=(x14 - mw/3, y14 + m/2);
z16=(x15 - mw/3, y15 - m/2);
z17=(x16, y8 );

paths[1] = z12{dir 30} ..  z13 .. z14 .. z15..z16..{dir -85}z17;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 3, 5 )
    nib(thinnib rotated 0 )( 2,4)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
anchor( "vc", (xpart(point 4 of paths[0]),0));
anchor( "bottom", point 1 of paths[1]);
anchor( "right", point 1 of paths[1]);
endglyph;
