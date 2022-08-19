input glyph;
beginglyph;
z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/4, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3, y3 - m/4); % bottom of piller
z5=(x3, y3);
z6=(x5 + mw/2, y5 + .6m); % Top of second arch
z7=(x6 + mw/3, y6 - m/2);
z8= ( x7 - mw/3, y7 - m/2);
z9= ( x8 - mw/4, y8 + .3m);

paths[0] = z0..z1..z2..z3---z4 ;
paths[1] = z5{up}..z6..z7..z8..z9.. z7;
paths[1]:= paths[1] slanted tand(8);
paths[1]:= paths[1] shifted (-tand(8)*mw/3, 0);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 0)(4 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5)
    nib(thinnib rotated 0 )(0, 2, 4, 6)
    nib(terminalnib rotated 60 )(infinity)
)(paths[1])(strokes[1]);
endglyph;
