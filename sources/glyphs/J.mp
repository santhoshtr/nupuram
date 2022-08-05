input glyph;
beginglyph;
z0= (0.4Xw, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.2X);
z3=( x2 - Xw/6, y2 - 0.25X);
z4=( x3 - Xw/6, y3 + X/3);

z5 = (x0 - 0.4Xw, y0 - thick*thin/2);
z6 = (x0 , y5);

paths[0] = z0..  z1..  z2..z3{left}..{dir 80}z4;
paths[1] = z5 -- z6;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 90)(0)
    nib(thinterminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);
endglyph;
