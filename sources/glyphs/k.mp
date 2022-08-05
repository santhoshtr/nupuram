input glyph;
beginglyph;

paths[0] = l_vstem ;
z0= (xpart(point 1 of l_vstem), s/3);
z1= ( x0 + sw/2, s);

paths[1] = z0--z1;
z2 = point .3 of paths[1];
z3 = (x1 + thick/2, 0);

paths[2] = z2--z3;

pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(

    nib(thinterminalnib rotated 120)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinterminalnib rotated 60)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[2])(strokes[2]);
endglyph;
