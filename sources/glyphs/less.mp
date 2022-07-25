input glyph;
beginglyph;
z0 = (thick/2, s/2 );
z1 = (x0 + 0.5sw, y0 + s/4);
z2 = (x0 + 0.5sw, y0 - s/4);
paths[0] = z0--z1;
paths[1] = z0--z2;
pen_stroke(
    nib(thinterminalnib rotated 90)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated 90)( 0)
    nib(terminalnib rotated 90)(infinity )
)(paths[1])(strokes[1]);
endglyph;
