input glyph;
beginglyph;
z0 = (thick/2, X );
z1 = (x0+ 0.2sw, y0 + m/3);
z2 = (x1 + 0.2sw, y0);
paths[0] = z0--z1;
paths[1] = z1--z2;
pen_stroke(
    nib(terminalnib rotated 0)(0)
    nib(thinterminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated 0)( 0)
    nib(terminalnib rotated 0)(infinity )
)(paths[1])(strokes[1]);
endglyph;
