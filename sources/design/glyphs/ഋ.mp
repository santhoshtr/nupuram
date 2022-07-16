input glyph;
beginglyph;
path paths[],strokes;

z0 = (0.25mw, 0.56m);
z1 = (x0 +  0.15mw, y0 + 0.2m );
z2 = (x1 -  0.15mw, y1 + 0.2m);
z3 = (x2 -  0.2mw, y2 - m/4);
z4 = (x3 + mw/2, y3 - m/4);
z5 = (x4 + m/3, y4 - m/4);
z6 = (x5 - m/2.5, y5 - m/4);
z7 = (x6 - m/2.5, y6 + m/4);
z8 = (x7 + m/3, y7 + m/4);
z9 = (x8 + mw/2, y8 + m/4);
z10 = (x9 -  0.2mw, y2);
z11 = (x10 -  0.15mw, y10 - 0.2m);
z12 = (x11 + 0.15mw, y11 - 0.2m);
paths[0] = z0 .. z1..z2..z3..z4..{down}z5{down}..{left}z6{left}..{up}z7{up}..z8..z9..z10..z11..z12 ;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2 ,6)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3,4,5,7,8,9,11 )
    nib(default_nib xyscaled(thin, terminalround) rotated 150)(0) % Sharp cut
    nib(default_nib xyscaled(thin, terminalround) rotated 30)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;
