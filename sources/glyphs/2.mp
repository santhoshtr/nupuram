input glyph;
beginglyph;
paths[0] = subpath (1.2, 2.6) of right_arch xyscaled(.9, 1);
x1= xpart(point 0 of paths[0]) ;
y1 = y2 = 0;
x2 = x1 + 0.75mw;
paths[0] := paths[0]  .. {dir 210}z1;
paths[1] = z1{dir 30}..{dir 30}z2 ;


pen_stroke(
    nib(thicknib rotated 0 )(1 )
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;