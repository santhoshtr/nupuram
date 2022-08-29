input glyph;
beginglyph;

paths[1] := a_loop;
paths[0] := r_vstem xyscaled(-1, -1) shifted(xpart(point 0 of paths[1]) + xpart(point 1 of r_vstem), s);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
anchor( "top", (xpart(point 1 of paths[1]), X) );
endglyph;
