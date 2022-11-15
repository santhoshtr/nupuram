input glyph;
beginglyph;
w := 0.6X;
z0=(0, X);
z1=(x0 + w/2, y0 - 0.5X);
z2=(x1 + w/2, y1 - 0.5X);
z3=(0, 0);
z4=(x3 + w/2, y3 + 0.5X);
z5=(x4 + w/2, y4 + 0.5X);

paths[0] = z0..z1..{dir -45}z2;
paths[1] = z3{dir 45}..z4..z5;
pen_stroke(
    nib(thicknib)(2,   4)
    nib(thinnib)(1, 3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib)(2,   4)
    nib(thinnib)(1, 3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
