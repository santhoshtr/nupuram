input glyph;
beginglyph;

z0=(mw/3+.5thick, 0);
z1=(x0 - mw/3, y0 + m/2);
z2=(x1 + mw/4, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3, y3 - m/4); % bottom of piller
paths[0] = z0..z1.. z2.. z3---z4 ;
paths[1]:= subpath(.8, 4) of right_arch shifted(x4, 0);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 0)(4 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(, 2, 4, 6)
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(thinterminalnib rotated 45)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[1])(strokes[1]);
endglyph;
