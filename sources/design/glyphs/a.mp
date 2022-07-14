input glyph;
beginglyph;
w := 0.8s;
z0= (w, s);
z1=( x0, y0 - s/2);
z2=( x1, y1 - s/2);

z3 = (x0, y0 - s/2 );
z4 = (x3 - w/2, y0 );
z5 = (x4 - w/2, y4 - s/2 );
z6 = (x5 + w/2, y5 - s/2.25);
z7 = (x6 + w/2, 0.3s);

paths[0] = z0{dir 240}..z1..  z2 ;
paths[1] = z3.. tension 1.25 ..z4..z5..z6..{dir 60}z7;

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2)
    nib(default_nib xyscaled(thin,terminalround) rotated 60)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

endglyph;
