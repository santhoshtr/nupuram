input glyph;
beginglyph;


paths[0] := left_arch_with_eye;
pen_stroke(
    nib(thicknib)(0, 2, 4, 6)
    nib(thinnib)(1,3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


paths[1] := subpath(1, 6) of da;
paths[1]:=paths[1] shifted (xpart(point 6 of paths[0]), 0);
pen_stroke(
    nib(thicknib)(3, 6)
    nib(thinnib)(2,4,6)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle 3 of paths[1])(3)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor("vc", point 5 of paths[0]);
anchor("bottom", point 4.25 of paths[1]);
anchor("right", point 4.25 of paths[1]);

endglyph;
