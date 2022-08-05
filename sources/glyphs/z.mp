input glyph;
beginglyph;

z0=(0, s- thick/2 );
z1=(x0 + .75sw, s);
z2=(x0, 0);
z3=(x1, thick/2);

paths[0] = z0--z1;
paths[1] = z1--z2;
paths[2] = z2--z3 ;
pen_stroke(
    nib(terminalnib rotated 90)(0)
    nib(thinterminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated 120)(0)
    nib(thinterminalnib rotated 120)(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(thinterminalnib rotated 120)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[2])(strokes[2]);

endglyph;
