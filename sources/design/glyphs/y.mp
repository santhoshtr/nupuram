input glyph;
beginglyph;
save w;
w = .7s;
z0=(w, s);
z1=(x0 - w/6, y0 - s);
z2=(0, y1-0.4s);

z3=(0, s);
z4=z1;

paths[0] = z0{dir -60}..z1..{left}z2;
paths[1] = z3{dir -40} .. {right}z4;

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(1,terminalround) rotated 0)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 90)(2)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(0)
    nib(default_nib xyscaled(thin,terminalround) rotated 45)(infinity)
)(paths[1])(strokes[1]);
endglyph;
