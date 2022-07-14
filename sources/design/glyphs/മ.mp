input glyph;
beginglyph;
path paths[], strokes;
z0=(0.3m, 2u);
z1=(x0 - 0.3m, y0 + 0.3m);
z2=(x1 + 0.4m, y1 + 0.3m);
z3=(x2 + 0.4m, y2 - 0.35m);
z4=(x1, 0);

z5=(x4, 0);
z6=(x5 + 0.9m, y5);
z7=(x6, y6 + 0.2m);
z8=(x7, y7 + 0.25m);
paths[0] = z0..z1{up}..{right}z2{right}..z3{down}.. {dir 240}z4;
paths[1] = z5{dir 30}..{dir 30}z6{dir 30}..z7...{dir 60}z8;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3,6)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 120)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 4, 5 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(2)
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
endglyph;
