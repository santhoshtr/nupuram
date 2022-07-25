input glyph;
beginglyph;
w := 0.8s;

z0 = (0.1w, 0.4s);
z1 = (x0+w,  y0 + .4s);
z2 = (x1-w/2, y1 + .2s);
z3 = (x2-w/2, y2 - s/2);
z4 = (x3+w/2, y3 - s/2);
z5 = (x4+w/2, y4 + s/3);

paths[0] = z0{dir 10}..z1..z2..z3..z4..z5;

pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(thinterminalnib rotated 110)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);

endglyph;
