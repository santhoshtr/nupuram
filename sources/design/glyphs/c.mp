input glyph;
beginglyph;
w := 0.5s;
z0= (1.6w, 0.75s);
z1=( x0 - w/2, y0 + 0.25s);
z2=( x1 - w, y1 - 0.4s);
z3=( x2 + w, 0);
z4=( x3 + w/2, y3 + 0.3s);

paths[0] = z0{up}..z1..  z2..z3..z4 ;

pen_stroke(
    nib(thinnib rotated 0 )(  2)
    nib(terminalnib rotated 30)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

endglyph;
