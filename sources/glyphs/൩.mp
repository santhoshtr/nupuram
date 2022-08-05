input glyph;
beginglyph;
paths[0] = subpath (0.2, 3.33) of left_arch;
paths[1] = subpath (1, 3) of right_arch_short shifted (xpart(point 3 of paths[0]), 0);
x1= xpart(point 3 of paths[1]) - mw/3;
y1 = y2= 0;
x2 = x1 + 0.6mw;
paths[1] := paths[1] ..z1;
paths[2] = z1{dir 30}..{dir 30}z2 ;


pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 150)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[2])(strokes[2]);
endglyph;
