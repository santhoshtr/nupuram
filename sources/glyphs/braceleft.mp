input glyph;
beginglyph;
z0 = (thick  + s/3, X );
z1 = (x0-s/3, y0 - s/3);
z2 = (x1-s/8, y0 - X/2);
z3 = (x1, y2 - s/3);
z4 = (x0, 0);
paths[0] = z0..z1..{left}z2;
paths[1] = z2{right}..z3.. z4;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(thinterminalnib rotated 90)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(thinterminalnib rotated 90)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);
endglyph;
