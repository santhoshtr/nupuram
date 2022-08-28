input glyph;
beginglyph;
w_ := 0.66X;
z0=(x1 + 0.01s, X);
z1=(0, 0.6X);
z2=(x1 + w_/2, 0);
z3=(x2 + w_/2, y1);
z4=(x3 - 0.01s, X);
paths[0] = z0..z1 ..{right}z2{right}..z3 ..z4 ;
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor( "top", (xpart(point 2 of paths[0]), 1.2X) );
endglyph;
