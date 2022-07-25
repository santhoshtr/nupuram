input glyph;
beginglyph;
w := 0.8s;
z0= (1.5w, 0.75X);
z1=( x0 - w/2, y0 + 0.25X);
z2=( x1 - w, y1 - 0.4X);
z3=( x2 + w, 0);
z4=( x3 + w/2, y3 + 0.3X);

paths[0] = z0{up}..z1..  z2..z3..z4 ;

pen_stroke(
    nib(thinnib rotated 0 )(  2)
    nib(terminalnib rotated 30)(0)
    nib(terminalnib rotated 30)(infinity)
)(paths[0])(strokes[0]);

endglyph;
