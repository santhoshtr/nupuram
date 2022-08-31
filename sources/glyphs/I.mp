input glyph;
beginglyph;

z0=(thick/2, X);
z1=(x0,y0 - X/2);
z2=(x1, 0);

paths[0] = z0{dir -90}..z1..  {dir -90}z2  ;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "top", (xpart(point 0 of paths[0]), 1.2X) );
endglyph;
