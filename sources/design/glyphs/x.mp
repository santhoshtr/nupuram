input glyph;
beginglyph;
w := 0.7s;
z0=(0, s);
z1=(x0 + w/2, y0 - s/2);
z2=(x1 + w/2, y1 - s/2);
z3=(0, 0);
z4=(x3 + w/2, y3 + s/2);
z5=(x4 + w/2, y4 + s/2);

paths[0] = z0{dir -30}..z1..{dir -30}z2;
paths[1] = z3{dir 30}..z4..{dir 30}z5;
pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
endglyph;
