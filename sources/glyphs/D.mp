input glyph;
beginglyph;
z0= (0, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);

z3 = (x0, X);
z4 = (x3 + sw/2, y3 - thick/2);
z5 = (x4 + 0.4*sw, 0.5X );
z6 = (x4,  thick/2 );
z7 = (0, 0);
paths[0] = z0..z1..z2;
paths[1] = z3{right}..z4..z5.. z6 ..{left}z7 ;

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
anchor( "top", (xpart(point 1 of paths[1]), 1.2X) );
endglyph;
