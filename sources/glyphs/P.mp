input glyph;
beginglyph;

z0= (0, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);

paths[0] = z0{dir -80}..z1..  {dir -80}z2 ;

z3 = (x0 -thick/2, 0.85X);
z4 = (x3 + Xw/3, y0 - thick/4);
z5 = (x4 + Xw/4, m );
z6 = point 1.25 of paths[0];
paths[1] = z3{dir 30} ..z4{right}..z5{down}..{dir 190}z6;

pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);

endglyph;
