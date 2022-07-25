input glyph;
beginglyph;

z0 =(u, m/3.5);
z1 =(x0 + mw/4, y0 + m/4);
z2=(x1 + mw/4, y1 - m/4);
z3=(x2 - mw/4, y2 - m/4);
z4=(x3 - m/3, y3 + m/2.5);
z5=(x4 + m/2.8, y4 + m/2);
z6=(x5 + m/2.4, y5-m/2);
z7=(x6, y6 - m/3);

paths[0] = z0{up}..z1{right}..z2{down}..z3{left}..z4.. z5..z6 ---z7;
pen_stroke(
    nib(thicknib rotated 0 )(1,3, 5 )
    nib(thinnib rotated 0 )(0, 2, 4, 6)
    nib(terminalnib rotated 135)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

z10 = z6;
z12 = ( x10 + m/2, y10 + m/2); % top

paths[1] = z10{up} ..z12{right} ;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7, )
    nib(thinnib rotated 0 )(0, 2, 4,6)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 135)(infinity)
)(paths[1])(strokes[1]);


z20 = (x12 , y12);
z21 = (x20 + mw/5, y20 - m/4);
z22 = (x21 - mw/5, y21 - m/4);
z23 = (x22 - mw/5, y22 + m/4);
z24 = (x23 + mw/4, y23 + m/4);
z25 = (x24 + mw/2.4, y24 - m/3);
z26 = (x25, y25 - m/5);

z27 = (x25, y25); % Second arch
z28 = (x27 + mw/3, y27 + m/3 + m/12);
z29 = (x28 + mw/3, y28 - m/3);
z30 = (x29 - mw/2, y29 - m/3);
z31 = (x30 - mw/2, y30 - m/12);
z32 = (x31 - mw/3, y31 - m/4);


z35 = (x32 + mw, y32 + m/3);
z36 = (x35 + mw/3, y35 - m/4);
z37 = (x36 - mw/4, y36 - m/4);
z38 = (x37 - mw/4, y37 + m/3 + m/6);
paths[2] = z20  ..z21 ..   z22 .. z23   .. z24  .. z25---z26 ;
paths[3] = z27{dir 85}..z28 ..z29..z30..  z32;
paths[4] = z32.. tension 1.5..z35..z36..z37..z38;

pen_stroke(
    nib(thicknib rotated 0 )(0,   3 )
    nib(thinnib rotated 0 )(1,3,5)
    nib(thinterminalnib rotated 90 )(0 )
    nib(terminalnib rotated 0 )(infinity )
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 4)
    nib(thinnib rotated 0 )( 2,3,4,5,7,9,11)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[3])(strokes[3]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 4)
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 120)(0)
    nib(thinterminalnib rotated 0)(infinity)
)(paths[4])(strokes[4]);

endglyph;
