input glyph;
beginglyph;

z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/4, y1 +  0.4m);
z3=(x2 + mw/3, m/2);
z4=(x3,  m/6); % bottom of piller
paths[0] = z0..z1.. z2.. {down}z3---z4 ;
paths[1]:= subpath(1, 4) of right_arch shifted(x3, 0);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 0)(4 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(2, 4, 6)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[1])(strokes[1]);
endglyph;
