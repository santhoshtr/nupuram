input glyph;
beginglyph;
z0 = (0, 3/4X);
z1 = (x0+ Xw/3, X);
z2 = (x1+ Xw/4, y0);
z3 = (0, thick/2);
paths[0] := z0   ..  z1..z2..{dir 210}z3;
z4 = z3 ;
z5 = (x2 + thick/2, y4) ;
paths[1] = z4{dir 20}..{dir 30}z5 ;

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