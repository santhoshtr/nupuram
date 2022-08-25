input glyph;
beginglyph;

z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
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

paths[1] = subpath(1, 6) of da shifted (xpart(z4), 0) ;
pen_stroke(
    nib(thicknib rotated 0 )( 3, 6 )
    nib(thinnib rotated 0 )(0, 2,4,6 )
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle 3 of paths[1])(3)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", point 4 of paths[0]);
anchor( "bottom", point 4.25 of paths[1]);
anchor( "right", point 4.25 of paths[1]);


endglyph;
