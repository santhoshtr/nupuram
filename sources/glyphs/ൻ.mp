input glyph;
beginglyph;
z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/4, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3, y3 - m/4); % bottom of piller
z5=(x3, y3);
z6=(x5 + mw/2.5, m-thick); % Top of second arch
z7=(x6 + mw/2.5, y6 - m/3);
z8=(x7 - mw/4, y7 - m/2);
z9=(x8 - mw/4, y8 + m/2);
z10=(x9 + mw/4, y9 + m/2);
z11=(x10 - mw/4, y10 + 0.3m);

paths[0] = z0..z1..{right}z2.. z3---z4 ;
paths[1] = z5{up}..z6..z7..z8 .. z9..z10{up}..{left}z11;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 10)(4 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3)
    nib(thinnib rotated 0 )(2,4, 5)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);
endglyph;
