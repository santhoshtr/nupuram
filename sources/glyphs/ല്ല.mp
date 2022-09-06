input glyph;

beginglyph;

paths[0] = la;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5 )
    nib(thinnib rotated 0 )(1,3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

paths[1] = la_sign shifted (xpart(point 3 of la), 0);
pen_stroke(
    nib(thinnib rotated 0 )(2,4,6,8)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", (xpart(point 2 of paths[0]),0));
anchor( "right", point 5.5 of paths[1]);

endglyph;