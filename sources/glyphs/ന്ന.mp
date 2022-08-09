input glyph;
beginglyph;
z3=(mw/3, 0);
z4=(x3 - mw/3, y3 + m/2);
z5=(x4 + mw/3, y4 + 0.4m);
z6=(x5 + mw/3, y5 - m/2);
z7=(x6, m/6);
% Second arch
z11 = z6;
z12 = (x11 + mw/4, y11 + m/3);
z13 = (x12 + mw/4, m/2);
z14 = (x13, y7);
paths[0] =  z3 ..z4.. z5..z6 ---z7;
paths[1] = z11{up}..z12..z13---z14;
paths[2] :=  subpath(1, 4) of right_arch shifted(x13, 0);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2,4,6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 60)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(1,3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[2])(strokes[2]);
endglyph;
