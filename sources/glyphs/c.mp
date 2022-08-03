input glyph;
beginglyph;

paths[0] = c_loop;

pen_stroke(
    nib(thicknib rotated 0 )(1,3)
    nib(thinnib rotated 0 )(2,4)
    nib(thinterminalnib rotated 0 )(0 )
    nib(thinterminalnib rotated 135 )(infinity )
)(paths[0])(strokes[0]);


endglyph;
