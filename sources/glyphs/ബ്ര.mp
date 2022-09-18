input glyph;
beginglyph;

paths[0] :=left_arch_with_eye shifted (mw/3, 0);
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

clearxy;
z0 = point 1.5 of paths[2];
z1 = (xpart(point 2 of paths[1]), -descent *1.2);
z2 = (xpart(point 2 of paths[0]), y1);
z3 = (xpart(point 0 of paths[0]) - mw/3, ypart(point 1 of paths[0]));
z4 = (x3 + mw/10, m);

paths[3] = z0{dir -75} ..{dir 190}z1 ..{dir 170}z2 ..z3..z4;
pen_stroke(
    nib(thinnib rotated 0 )(3)
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor( "vc",  point 5 of paths[0] );
anchor( "right", point 0.75 of paths[3]);
endglyph;
