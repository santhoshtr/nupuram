input glyph;

beginglyph;

z0=(2u, 0);
z1=(x0 - 1.5u, 0.5m);
z2=(x0 + 1.5u, y1 + 0.5m);
z3=(x2 + 2u, y2 - 0.5m);
z4=(x2, 0);

paths[0]:= z0{dir 135}..z1..{right}z2..z3{dir 260}..z4;


pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2,   5, 6 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[0])(strokes[0]);



endglyph;
