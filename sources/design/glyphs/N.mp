input glyph;
beginglyph;
w := 0.6X;
z0= (u, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);
z3 = (x0, y0);
z4 = (x3 + w/2, y1);
z5 = (x3 + w, y2);
z6 = z5;
z7 = (x6, y0);
paths[0] = z0{dir -60}..z1..  z2 ;
paths[1] = z3{dir -45}..z4..{dir -45}z5;
paths[2] = z6{dir 120}..{dir 120}z7;
pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 2)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(infinity) % Sharp cut
)(paths[2])(strokes[2]);
endglyph;
