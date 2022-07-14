input glyph;
beginglyph;
w := 0.75s;
z0=(0, s);
z1=(x0 + w/2, y0 - 0.05s);
z2=(x1 + w/2  , y1 + 0.05s);
z3=(x2 - w/2, y2 - 0.5s);
z4=(x3 - w/2, y3 - 0.5s);
z5=(x4 + w/2, y4 + 0.05s);
z6=(x5 + w/2 , y5 - 0.05s);
paths[0] = z0...z1...{dir 20}z2;
paths[1] = z2{dir 225}...z3...{dir 225}z4;
paths[2] = z4{dir 20}...z5...z6  ;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2,  4 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5)
    nib(default_nib xyscaled(xthick,terminalround) rotated 110)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1 )
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2,  4 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5)
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(infinity) % Sharp cut
)(paths[2])(strokes[2]);

endglyph;
