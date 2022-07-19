input glyph;
beginglyph;
path paths[], strokes;
z0=(1u, X);
z1=(x0, 0.5X);
z2=(x1, 0);

paths[0] = z0{dir -80}..z1..  {dir -80}z2 ;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
