input glyph;
beginglyph;
z0= (Xw/3, X);
z1=( x0 , X/3);
z2=( x1 - Xw/6, 0);
z3=( x2 - Xw/6, y2 + X/4);

z5 = (x0 - Xw/3, y0 - thick*thin/2);
z6 = (x0 , y5);

paths[0] = z0..  z1{down}..z2{left}..{dir 80}z3;
paths[1] = z5 ..{dir -10} z6;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 90)(0)
    nib(thinterminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);
endglyph;
