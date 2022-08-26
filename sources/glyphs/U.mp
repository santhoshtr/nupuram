input glyph;
beginglyph;
w_ := 0.66X;
z0=(0, X);
z1=(x0, y0 - 0.5X);
z2=(x1 + w_/2, y1 - 0.5X);
z3=(x2 + w_/2, y2 + 0.5X);
z4=(x3, y3 + 0.5X);
paths[0] = z0{dir 260}..z1..z2..z3.. {dir 100}z4 ;
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor( "top", (xpart(point 2 of paths[0]), 1.2X) );
endglyph;
