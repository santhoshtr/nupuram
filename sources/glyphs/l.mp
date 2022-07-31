input glyph;
beginglyph;

z0=(thick/2, X);
z1=(x0,  y0 - (phi-1)*X);
z2=(x1, 0);

paths[0] = z0{dir -80}..z1..  {dir -80}z2 ;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

endglyph;
