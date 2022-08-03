input glyph;
beginglyph;

paths[0] := l_vstem xyscaled(1,-1) shifted(0, X);
paths[1] := p_loop shifted(  xpart(point 1 of l_vstem),0);
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
