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
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(1,terminalround) rotated 0)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 0)(2)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0)
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(infinity)
)(paths[1])(strokes[1]);
endglyph;
