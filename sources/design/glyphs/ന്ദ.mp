input glyph;
beginglyph;

z0=(mw/4+.5thick, 0);
z1=(x0 - mw/4, y0 + m/2);
z2=(x1 + mw/4, y1 + m/2);
z3=(x2 + mw/3, y2 - m/2);
z4=(x3, y3 - m/3); % bottom of piller
paths[0] = z0..z1.. z2.. z3---z4 ;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 0)(4 )
)(paths[0])(strokes[0]);

z20 = ( x3, y3 );
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
