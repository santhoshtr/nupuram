input glyph;
beginglyph;

paths[0] := u_arch ;
paths[1] := r_vstem xyscaled(-1, -1) shifted(xpart(point 4 of paths[0]) + xpart(point 1 of r_vstem), s);

pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
anchor( "top", (xpart(point 2.5 of paths[0]), X) );
endglyph;
