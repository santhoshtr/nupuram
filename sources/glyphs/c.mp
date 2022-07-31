input glyph;
beginglyph;

z0= (2/3sw, 0.8s);
z1=( x0 - sw/3, s-thick/4);
z2=( x1 - sw/3, s/2);
z3=( x1, thick/4);
z4=( x3 + sw/3, y3 + 0.2s);

paths[0] = z0 ..z1..z2..z3..{dir 80}z4 ;

pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 60)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

endglyph;
