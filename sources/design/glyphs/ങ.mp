input glyph;
beginglyph;

z0 =(u, m/3.5);
z1 =(x0 + mw/4, y0 + m/4);
z2=(x1 + mw/4, y1 - m/4);
z3=(x2 - mw/4, y2 - m/4);
z4=(x3 - m/3, y3 + m/2.5);
z5=(x4 + m/2.8, y4 + m/2);
z6=(x5 + m/2.4, y5-m/2.25);
z7=(x6, y6 - m/2.5);

paths[0] = z0{up}..z1{right}..z2{down}..z3{left}..z4.. z5..z6 ---z7;
pen_stroke(
    nib(thicknib rotated 0 )(1,3, 5 )
    nib(thinnib rotated 0 )(0, 2, 4, 6)
    nib(terminalnib rotated 135)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

z20 = ( x6, y6 );
z21 = ( x20 + m/3, y20 + m/2);
z22 = ( x21 + m/3, y21 - m/4);
z23 = ( x22 - m/3, y22 - m/4);
paths[1] = z20{up}..z21..z22..{left}z23{left} ;
pen_stroke(
    nib(thicknib rotated 0 )( 3, 6 )
    nib(thinnib rotated 0 )(0, 2,4,6 )
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[1])(strokes[1]);


z30 = z23;
z31 = (x30 + mw/2.5, y30 - m/4);
z32 = (x31 - mw/2.5, y31 - m/4);
paths[2] = z30{right}..z31..z32 ;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 60)(infinity)
)(paths[2])(strokes[2]);

endglyph;
