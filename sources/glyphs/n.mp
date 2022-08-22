input glyph;
beginglyph;

paths[0] := r_vstem;
paths[1] := n_arch shifted(xpart(point 1 of r_vstem),0);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0 )
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1] )(infinity )
)(paths[1])(strokes[1]);
endglyph;
