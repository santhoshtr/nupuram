input glyph;
beginglyph;
save w;
w = X/2;
z0=(0, X);
z1=(x0+w/2, y0 - 0.6X);
z2=(x1, 0);

z3=(w, X);
z4=(x3-w/2, y0 - 0.6X);

paths[0] = z0{down}..z1..z2;
paths[1] = z3{down}..z4;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
