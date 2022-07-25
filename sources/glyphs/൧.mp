input glyph;
beginglyph;
z10=(mw/3, -m/3);
z11=(x10- mw/4, y10 + m/6);
z12=(x11 + mw/4, y11 + m/6);
z13=(x12 + mw, y12);
z14=(x13, y13 + m*0.5);
z15=(x14 - mw/3, y14 + m/2);
z16=(x15 - mw/3, y15 - m/2);
z17=(x16, y12 );

paths[0] = z10..z11..{dir 10}z12 .. z13..z14{dir 100} .. z15..z16..z17;
pen_stroke(
    nib(thicknib rotated 0 )( 3, 5 )
    nib(thinnib rotated 0 )(1, 2,4,6)
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 30)(infinity)
)(paths[0])(strokes[0]);

endglyph;
