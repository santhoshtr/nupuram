input glyph;
beginglyph;

z0=(0, s);
z1=(x0, y0 - 0.6s);
z2=(x1, 0);

z3= z1;
z4=(x2 + sw/2, y0);

paths[0] = z0{dir -60}..z1..z2;
paths[1] = z3{dir 80}..{dir 20}z4;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0,2)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(0, )
    nib(terminalnib rotated 90)(1)
)(paths[1])(strokes[1]);
endglyph;
