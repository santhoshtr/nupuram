input glyph;
beginglyph;

paths[0] := r_vstem;
paths[1] := subpath(0.25, 4) of n_arch shifted(xpart(point 1 of r_vstem),0);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0 )
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1] )(infinity )
)(paths[1])(strokes[1]);
anchor( "top", (xpart(point 1.5 of paths[1]), X) );
anchor( "bottom", (xpart(point 1.5 of paths[1]), 0) );
endglyph;
