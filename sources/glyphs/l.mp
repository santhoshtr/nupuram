input glyph;
beginglyph;

z0=(thick/2, X);
z1=(x0,  y0 - X/2);
z2=(x1, 0);

paths[0] = z0{dir -80}..z1..  {dir -80}z2 ;
pen_stroke(

    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 10)(0)
    nib(terminalnib rotated 10)(infinity)
)(paths[0])(strokes[0]);

endglyph;
