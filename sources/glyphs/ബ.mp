input glyph;
beginglyph;

paths[0] :=left_arch_with_eye;
% Second arch
clearxy;
z0 = point 5 of paths[0];
z1 = (x0 + mw/3, 0.9m);
z2 = (x1 + mw/4, y1 - m/3);
z3 = (x2 - mw/3, y2 - m/2);
paths[1] = z0{up}..z1..z2..z3;
paths[2] = va_tail shifted (point 4 of paths[1]) ;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6)
    nib(thinnib rotated 0 )(1,3, 5 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", (xpart(point 5 of paths[0]),0));
anchor( "bottom", (xpart(point 1 of paths[2]),0));
anchor( "right", (xpart(point 1 of paths[2]),0));
endglyph;
