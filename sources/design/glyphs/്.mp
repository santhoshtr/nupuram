input glyph;
beginglyph;
path paths[], strokes;
z0 = (0, ascent+0.2m);
z1=(x0 + 0.3m, y0-0.4m);
z2=(x1 + 0.3m, y0);


paths[0] = z0{down}..{right}z1..{up}z2  ;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1)
    nib(default_nib xyscaled(1,terminalround) rotated 30)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 30)(2)
)(paths[0])(strokes[0]);

endglyph;
