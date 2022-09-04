input glyph;
beginglyph;
z0=(x3+thick*0.15, y3);
z1=(x0 + mw/2, y3 - m/4);
z2=(x1 - mw/5, 0);
z3=(0, m/2);
z4=(x3 + mw/2, m);
z5=(x4 + mw/2, m/2);
z6=(x5 - mw/3, 0);
paths[0] = z0 .. z1{down}..z2{left}..z3.. z4..{down}z5 ..{dir 210}z6;
paths[1] := va_tail shifted point infinity of paths[0];

pen_stroke(
    nib(thicknib rotated 0 )(2,4,6)
    nib(thinnib rotated 0 )(1,3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
anchor( "vc", z4);
anchor( "bottom", point 1 of paths[1]);
anchor( "right", point 1 of paths[1]);

endglyph;
