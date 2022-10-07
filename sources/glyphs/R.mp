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
clearxy;
z0 =  point 2.75 of paths[1];
z1 = (xpart(point 2 of paths[1]),0);
paths[2] = z0{dir -60}.. {dir -30}z1;

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
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
anchor( "top", (xpart(point 1 of paths[1]), 1.2X) );
anchor( "bottom", (xpart(point 1 of paths[1]), 0) );
endglyph;
