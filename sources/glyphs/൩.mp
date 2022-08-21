input glyph;
beginglyph;
paths[0] = subpath (0.2, 3.33) of left_arch;
paths[1] = subpath (1, 3) of right_arch_short shifted (xpart(point 3 of paths[0]), 0);
x1= xpart(point 3 of paths[1]) - mw/3;
y1 = y2= 0;
x2 = x1 + 0.6mw;
paths[1] := paths[1] ..{dir 210}z1;
paths[2] = z1{dir 20}..{dir 20}z2 ;


pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle infinity of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
