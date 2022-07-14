input glyph;

beginglyph;

z0=(2u, 0.2m);
z1=(x0 - m/3, y0 + m/2);
z2=(x1 + m/2, y1 + m/3);
z3=(x2 + m/2, y2 - m/3);
z4=(x3 - m/3, y3 - m/2);

paths[0]:= z0 ..z1..{right}z2..z3 ..z4;
paths[1]:= paths[0] shifted (0.1m, -y2 + 0.2m) xscaled 0.9 yscaled 0.9;


pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 5, 6 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[0])(strokes[0]);


pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2,   5, 6 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

endglyph;
