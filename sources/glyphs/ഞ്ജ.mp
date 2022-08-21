input glyph;
beginglyph;
paths[0] :=left_arch_with_eye;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6)
    nib(thinnib rotated 0 )(1,3, 5 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


z10 = point 5 of paths[0];
z12 = ( x10 + m/2, y10 + m/2); % top

paths[1] = z10{up} ..z12{right} ;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7, )
    nib(thinnib rotated 0 )(0, 2, 4,6)
    nib(thinterminalnib rotated  terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


z20 = (x12   , y12);
z21 = (x20 + mw/5, y20 - m/4);
z22 = (x21 - mw/5, y21 - m/3);
z23 = (x22 - mw/5, y22 + m/4);
z24 = (x23 + mw/4, m);
z25 = (x24 + mw/2.4, y24 - m/3);
z26 = (x25, y25 - m/5);

z27 = (x25, y25); % Second arch
z28 = (x27 + mw/3, y27 + m/3 + m/12);
z29 = (x28 + mw/3, y28 - m/3);
z30 = (x29 - mw/2, y29 - m/3);
z31 = (x30 - mw/2, y30 - m/12);
z32 = (x31 - mw/3, 0);


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
    nib(thinterminalnib rotated  terminalangle 0 of paths[2] )(0 )
    nib(terminalnib rotated terminalangle infinity of paths[2] )(infinity )
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 4)
    nib(thinnib rotated 0 )( 2,3,4,5,7,9,11)
    nib(thinterminalnib rotated  terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 4)
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[4])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[4])(infinity)
)(paths[4])(strokes[4]);

endglyph;
