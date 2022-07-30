input glyph;
beginglyph;
z0= (0.75Xw, 0.85X);
z1=( x0 - Xw/3, y0 + 0.15X);
z2=( x1 - Xw/3, y1 - 0.4X);
z3=( x2 + 0.95*Xw/3, 0);
z4=( x3 + Xw/3, y3 + 0.25X);

paths[0] = z0{dir 120}..z1..  z2..z3..{dir 80}z4 ;

pen_stroke(
    nib(thinnib rotated 0 )(  2)
    nib(terminalnib rotated 60)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

endglyph;
