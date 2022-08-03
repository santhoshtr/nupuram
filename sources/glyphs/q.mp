input glyph;
beginglyph;
paths[1] := a_loop;
paths[0] := p_vstem xyscaled(-1, 1) shifted(xpart(point 0 of paths[1]) + xpart(point 1 of p_vstem),0);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 135 )(0 )
    nib(terminalnib rotated 0 )(infinity )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 120 )(0 )
    nib(thinterminalnib rotated 60 )(infinity )
)(paths[1])(strokes[1]);
endglyph;
