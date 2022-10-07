input glyph;
beginglyph;

z0= (0, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);

paths[0] = z0{dir -90}..z1..  {dir -90}z2 ;

clearxy;

z0 = (xpart (point 0 of paths[0]) - X/10, 0.9X);
z1 = (x0 + Xw/3, ypart (point 0 of paths[0]) - thick/4);
z2 = (x1 + Xw/4, m );
z3 = point 1.25 of paths[0];
paths[1] = z0..z1{right}..z2{down}..{left}z3;

pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;
