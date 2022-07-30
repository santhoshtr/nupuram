input glyph;
beginglyph;

z0= (.8s, 0.85s);
z1=( x0 - sw/4, y0 + 0.15s);
z2=( x1 - sw/2, y1 - 0.4s);
z3=( x2 + 0.95*sw/2, 0);
z4=( x3 + sw/4, y3 + 0.25s);

paths[0] = z0{dir 120}..z1..  z2..z3..{dir 80}z4 ;

pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 60)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

endglyph;
