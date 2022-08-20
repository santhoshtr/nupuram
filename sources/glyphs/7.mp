input glyph;
beginglyph;
z0=(0, .9X);
z1=(x0 + .67mw, X);
z2=(x1 - mw/4, 0);

paths[0] = z0{right} ..{dir 30}z1;
paths[1] = z1{dir 250}..{down}z2;

pen_stroke(
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[1])(strokes[1]);
endglyph;