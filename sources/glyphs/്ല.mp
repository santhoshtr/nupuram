input glyph;

beginglyph;

paths[0] = la_sign;
pen_stroke(
    nib(thicknib rotated 0 )(2,4 )
    nib(thinnib rotated 0 )(2,4,6,8)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "bottom", (xpart(point 6.5 of paths[0]),0));
anchor( "right", (xpart(point 6.5 of paths[0]),0));
endglyph;