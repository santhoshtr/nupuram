input glyph;
beginglyph;
paths[0] :=left_arch_with_eye;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6)
    nib(thinnib rotated 0 )(1,3, 5 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
% Second arch
z11 = point 5 of paths[0];
z12 = (x11 + mw/4, y11 + m/2.5);
z13 = (x12 + mw/4, y12 - m/3);
z14 = (x13, y13 - m/2.5);

paths[1] = z11{up}..z12..z13---z14;

% Third arch
z0=point 2 of paths[1];
z1=(x0 + mw/3, m);
z2=(x1 + mw/3, y1 - m/3);
z3= ( x2 - mw/3, m/2);
z4= ( x3 + mw/3, y3 - .2m);
z5 = ( x4 + mw/6, y4 - .15m);
z6 = ( x1, 0);

paths[2] = z0{up}..z1..z2...z3..z4{right}..z5..{dir 160}z6;
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinnib rotated 0 )(2,4,5)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
anchor( "vc", point 1 of paths[1]);
anchor( "bottom", point 5.6 of paths[2]);
anchor( "right", point 5.6 of paths[2]);

endglyph;
