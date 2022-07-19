input glyph;
beginglyph;
w := 0.5X;
z0=(0, X);
z1=(x0 + w/3, y0 - 0.5X);
z2=(x1 + w/4, y1 - 0.5X);
z3=(x2 + 0.8w, y2 + 0.5X);
z4=(x3, y3 + 0.5X);
paths[0] = z0...z1...{dir -45}z2{dir 45}...z3..z4 ;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;
