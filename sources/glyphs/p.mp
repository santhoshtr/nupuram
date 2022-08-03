input glyph;
beginglyph;

paths[0] := p_vstem;
paths[1] := p_loop shifted(xpart(point 1 of p_vstem),0);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 45 )(0 )
    nib(terminalnib rotated 0 )(infinity )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 120 )(0 )
    nib(thinterminalnib rotated 60 )(infinity )
)(paths[1])(strokes[1]);
endglyph;
