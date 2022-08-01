input glyph;
beginglyph;
z0 = (thick+ sw/4, X );
z1 = (x0 - sw/4, y0 - s/3);
z2 = (x1 - sw/8, y0 - X/2);
z3 = (x1, y2 - s/4);
z4 = (x0, 0);
paths[0] = z0{left}..z1{down}..{left}z2;
paths[1] = z2{right}..z3{down}.. {right}z4;

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
