input glyph;
beginglyph;

z0=(x1+mw/3, 0);
z1=(mw/3, y0 + m/2);
z2=(x1 + mw/3, y1 + 0.4m);
z3=(x2 + mw/3, m/2);
z4=(x3,  m/6); % bottom of piller
paths[0] = z0..z1.. z2.. z3---z4 ;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

paths[1] = subpath(1, 4) of da shifted (xpart(z4), 0) ;
clearxy;
z0=(xpart(point infinity of paths[1]) + 0.4mw, 0);
z1=(x0- mw/2, -descent*1.2);
z2=(xpart(point 2.25 of paths[0]), y1);
z3=(xpart(point 1 of paths[0]) - mw/3, m/3);
z4=(x3 + mw/6, m);
paths[1] := paths[1] {right}..z0 .. {dir 190}z1 ..{dir 170}z2..z3..{dir 60}z4;
pen_stroke(
    nib(thicknib rotated 0 )( 3, 6 )
    nib(thinnib rotated 0 )(0, 2,4,7 )
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle 3 of paths[1])(3)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", point 4 of paths[0]);
anchor( "right", point 4.25 of paths[1]);

endglyph;
