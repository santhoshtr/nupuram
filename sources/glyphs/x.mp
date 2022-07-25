input glyph;
beginglyph;
w := 0.7s;
z0=(0, s);
z1=(x0 + w/2, y0 - s/2);
z2=(x1 + w/2, y1 - s/2);
z3=(0, 0);
z4=(x3 + w/2, y3 + s/2);
z5=(x4 + w/2, y4 + s/2);

paths[0] = z0{dir -30}..z1..{dir -30}z2;
paths[1] = z3{dir 30}..z4..{dir 30}z5;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 30)(0)
    nib(terminalnib rotated 30)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 135)(0)
    nib(terminalnib rotated 135)(infinity)
)(paths[1])(strokes[1]);
endglyph;
