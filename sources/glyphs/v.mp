input glyph;
beginglyph;
z0=(0, s);
z1=(x0 + sw/3, 0);
z2=(x1 + sw/3, y0);
paths[0] = z0--z1 ;
paths[1] = z1--z2 ;
pen_stroke(
    nib(terminalnib rotated 30)(0)
    nib(thinterminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 150)(infinity)
)(paths[1])(strokes[1]);
endglyph;
