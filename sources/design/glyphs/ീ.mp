input glyph;
beginglyph;

z0=(m/3, m+m/3);
z1=(0, y0 - m/4);
z2=(0, m+m/3);
z3=(x2 + 0.66m, y2 - m/4);
z4=(x3, y3 - m/3);
z5=(x4, 0);

paths[0] =  z0{dir 270}..z1  .. z2.. z3..z4{dir 260}..{dir -60}z5;
paths[0] := paths[0] shifted (-x3+thick/2,0);

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3,4)
    nib(default_nib xyscaled(1,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
