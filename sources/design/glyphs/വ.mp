input glyph;
beginglyph;
z0=(m/4+thick/2, 0);
z1=(x0- mw/4, m/2);
z2=(x0 + m/3, y1 + m/2);
z3=(x2 + m/3, y2-m/2);
z4=(x2, 0);
z5=(x4 , 0);
z6=(x5 + 0.6mw, y5);
z7=(x6, y6 + m*0.5);
z8=(x7, y7 + m*0.5);
paths[0] = z0{dir 135}..z1..{right}z2..z3{dir 260}..z4;
paths[1] = z5{dir 30}..{dir 30}z6{dir 30}..z7...{dir 60}z8;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5, 6 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 120)(7) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2)
    nib(default_nib xyscaled(1,terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 170)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
endglyph;
