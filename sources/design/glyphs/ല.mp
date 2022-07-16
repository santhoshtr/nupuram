input glyph;
beginglyph;
z0=(1.5u, m/3);
z1=(x0 + mw/2, m/2);
z2=(x1 - m/3, y0 + 0.667m);
z3=(x2 - m/3, y0);
z4=(x3, 0);
z5=(x4 + mw, y4);
z6=(x5, y5 + m*0.5);
z7=(x6, y6 + m*0.5);

paths[0] = z0 ..z1.. z2..z3{dir 280}..{dir 240}z4{dir 30}..{dir 30}z5{dir 30}..z6...{dir 60}z7;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3, 6)
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 150)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;