input glyph;
beginglyph;
path paths[],strokes;
soften:=0;
z0 = (.5u, 0.6m);
z1 = (x0 + 0.25m, y0   );
z2 = (x1 + 0.25m, y1 - 0.3m);
z3 = (x2 - 0.25m, y2 - 0.3m);
z4 = (x3 - 0.3m, y3 + 0.5m);
z5 = (x4 + 0.5m, y4 + 0.5m);
z6 = (x5 + 0.35m, y5 - 0.3m);
z7 = (x6 - 0.2m, y6 - 0.25m);
z8 = (x7 + 0.35m, y7 - 0.2m);
z9 = (x8 - 0.35m, y8 - 0.2m);

paths[0] = z0  .. z1..  z2..{left}z3 ;
paths[1] = z3{left}..z4 .. z5..z6.. {dir 200}z7 ;
paths[2]:= z7..z8..z9;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )( 2 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,2, 4)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(thin,terminalround) rotated 120)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,4)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(infinity) % Sharp cut
)(paths[2])(strokes[2]);

endglyph;
