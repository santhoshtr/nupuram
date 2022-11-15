input glyph;
beginglyph;

paths[0] := left_arch_with_eye;
pen_stroke(
    nib(thicknib)(0, 2, 4, 6)
    nib(thinnib)(1,3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;

paths[1] = subpath(1, 4) of right_arch shifted(xpart(point infinity of paths[0]), 0);
pen_stroke(
    nib(thicknib)(1, 3, 5, 7,)
    nib(thinnib)(0, 2, 4,6)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;
