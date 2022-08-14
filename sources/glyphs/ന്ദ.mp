input glyph;
beginglyph;

z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/4, y1 + 0.4m);
z3=(x2 + mw/3, m/2);
z4=(x3,  m/6); % bottom of piller
paths[0] = z0..z1.. z2.. z3---z4 ;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 0)(4 )
)(paths[0])(strokes[0]);

z20 = ( x3, y3 );
z21 = ( x20 + m/3, m);
z22 = ( x21 + m/3, y21 - m/4);
z23 = ( x22 - m/3, y22 - m/4);
paths[1] = subpath(1, 6) of da shifted (xpart(z4), 0) ;
pen_stroke(
    nib(thicknib rotated 0 )( 3, 6 )
    nib(thinnib rotated 0 )(0, 2,4,6 )
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 60)(3)
    nib(terminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);



endglyph;
