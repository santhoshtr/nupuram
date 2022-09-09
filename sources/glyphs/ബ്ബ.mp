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
% Shoe
z20 = (xpart(point 1 of paths[2]) + thick/2, ypart(point 1 of paths[2]));
z21 = (x20, y20 - m/3 );
z22 = (xpart(point 0 of paths[2]), y21);
z23 = (x22 + mw/4, 0);
paths[3] = z20--z21--z22{dir 30}.. z23;
pen_stroke(
    nib(thicknib rotated 0 )(  3)
    nib(thinnib rotated 0 )(1,2)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor( "vc", (xpart(point 5 of paths[0]),0));
anchor( "right", point 1 of paths[3]);
endglyph;
