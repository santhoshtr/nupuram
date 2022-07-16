input glyph;
beginglyph;

z0=(0, m+m/3);
z1=(x0 + 0.66mw, y0 - m/4);
z2=(x1, y1 - m/3);
z3=(x2, 0);

paths[0] =  z0{dir 40} .. z1.. z2{dir 260}..{dir -60}z3;
paths[0] := paths[0] shifted (-x1+thick/2,0);

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,1,    )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 2,3)
    nib(default_nib xyscaled(1,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
