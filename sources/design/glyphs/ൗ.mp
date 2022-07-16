input glyph;
beginglyph;
z0 = (thick/2, 0.6m);
z1 = (x0 + 0.25m, y0 + 0.35m);
z2 = (x1 + 0.25m, y1 - 0.45m);
z3 = (x2, y2 - .35m);
z4 = (x2, y2);
z5 = (x4 + 0.25m, y4 + .45m);
z6 = (x5 + 0.25m, y5 - .3m);
z7 = (x6 - 0.5m, y6 -.6m);

paths[0] = z0{dir 100}..{right}z1..{down}z2 ;
paths[1] = z4{up}..z5{right}..{down}z6{down}..{left}z7{left};
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(1, terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(1, terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2)
    nib(default_nib xyscaled(1, terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(1, terminalround) rotated 90)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

endglyph;
