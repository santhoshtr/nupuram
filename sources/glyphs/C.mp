input glyph;
beginglyph;

z0= (2/3Xw, 0.8X);
z1=( x0 - Xw/3, X-thick/4);
z2=( x1 - Xw/3, X/2);
z3=( x1, thick/4);
z4=( x3 + Xw/3, y3 + 0.2X);

paths[0] = z0 ..z1..z2..z3..{dir 80}z4 ;

pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor( "top", (xpart(point 1 of paths[0]), 1.2X) );
anchor( "bottom", (xpart(point 3 of paths[0]), 0) );
endglyph;
