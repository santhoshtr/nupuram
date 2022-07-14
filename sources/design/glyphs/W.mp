input glyph;
beginglyph;
w := 0.5X;
z0=(0, X);
z1=(x0 + w/4, y0 - 0.5X);
z2=(x1  , y1 - 0.5X);
z3=(x2 + 0.75w, y2 + 0.7X);
z4=(x3 + 0.75w, y3 - 0.7X);
z5=(x4 + w/3, y4 + 0.5X);
z6=(x5 - w/4, y5 + 0.5X);
paths[0] = z0..z1..{dir -45}z2{dir 45}..{up}z3{dir -45}..{dir -45}z4{dir 45}..z5..z6  ;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2,   4 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5)
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;
