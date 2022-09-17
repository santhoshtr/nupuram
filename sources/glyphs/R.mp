input glyph;
beginglyph;

z0= (0, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);

paths[0] = z0{dir -90}..z1..  {dir -90}z2 ;

z3 = (x0 -thick/2, 0.85X);
z4 = (x3 + Xw/3, y0 - thick/4);
z5 = (x4 + Xw/4, m );
z6 = point 1.25 of paths[0];
paths[1] = z3  ..z4{right}..z5{down}..{left}z6;
z7 =  point 2.75 of paths[1];
z8 = (x5,0);
paths[2] = z7{dir -60}.. {dir -30}z8;

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
