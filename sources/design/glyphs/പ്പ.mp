input glyph;
beginglyph;
z0=(m/4, -0.5u);
z1=(x0 - m/6, m/4);
z2=(x0 + m/6, y1 + m/4);
z3=(x2 + m/4, y2-m/4);
z4=(x2, 0);
z5=(x4, 0);
z6=(x5 + 0.6m, y5);
z7=(x6, y6 + m/2);
z8=(x7, y7 + m/2);

z10= (x1, 0.8s);
z11= (x10+m/2, y10);
z12= (x6, y11);

paths[0] = z0{dir 135}..z1..{right}z2..z3{dir 260}..z4;
paths[1] := z5{dir 30}..{dir30}z6{dir 30}..z7...{dir 60}z8;
paths[2] := z10{dir 60}..z11..{dir60}z12;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5, 6 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 120)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3)
    nib(default_nib xyscaled(thin, 1) rotated 0 )(2)
    nib(default_nib xyscaled(1 ,terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 170)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(1 ,terminalround) rotated 120)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[2])(strokes[2]);


endglyph;
