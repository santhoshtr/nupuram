input glyph;
beginglyph;
z0 = (sw/3, m/6);
z1 = (x0  -sw/6, y0 - m/4);
z2 = (x1 + sw/3, y1 - m/4);
z3 = (x0 - sw/3, y1 - m/4);

paths[0] = z0--z1;
paths[1] = z1{right}..z2..z3;

pen_stroke(
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(1)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated 45)(0)
    nib(thinnib rotated 0)(1)
    nib(terminalnib rotated 60)(2)
)(paths[1])(strokes[1]);

endglyph;
