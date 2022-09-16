input glyph;
beginglyph;

paths[0] := da;

pen_stroke(
    nib(thicknib rotated 0 )( 0, 2,4,6 )
    nib(thinnib rotated 0 )( 1, 3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 4 of paths[0])(4)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

z20 = point 5.7 of paths[0];
z21 = (x20 + m/3, y20 - m/4);
z22 = (xpart(point 56 of paths[0]), y21 - m/4);

paths[1] = z20{dir -20}..z21..{dir 160}z22 ;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", point 2 of paths[0]);
anchor( "right", point 1.5 of paths[1]);

endglyph;
