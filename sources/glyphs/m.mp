input glyph;
beginglyph;


paths[0] := r_vstem;
paths[1] := n_arch xyscaled (.9, 1) shifted(xpart(point 1 of r_vstem),0) ;
paths[2] := paths[1] shifted(xpart(point 2 of paths[1]) - xpart(point 1 of paths[0])   ,0);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 45 )(0 )
    nib(terminalnib rotated 0 )(infinity )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 0 )(0 )
    nib(terminalnib rotated 0 )(infinity )
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 0 )(0 )
    nib(terminalnib rotated 0 )(infinity )
)(paths[2])(strokes[2]);
endglyph;
