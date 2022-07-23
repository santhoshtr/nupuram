input glyph;
beginglyph;

z0=(thick/2, -thick/2);
z1=(x0, y0+ m/2);
z2=(x0, y1 + m/2);
z3=(x2 + 0.66mw, y2-0.4m);
z4=(x3 -mw/4, 0);
z5=(x4, 0);
z6=(x5 + 0.6mw, y5);
z7=(x6, y6 + m*0.5);
z8=(x7, y7 + m*0.5);
paths[0] = z0 ..z1.. z2..{dir -80}z3 ..z4;
paths[1] = z5{dir 30}..{dir 30}z6{dir 30}..z7...{dir 60}z8;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5, 6 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 120)(7) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2)
    nib(default_nib xyscaled(1,terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 170)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

% Shoe
z10 = z7;
z11 = (x10 + mw/8, y10-m/2);
z12 = (x10, y11 - m/3 );
z13 = (x12 - mw/2, y12);

paths[2] = z10{down}..z11{down}..z12 .. z13 ;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(  3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,2)
    nib(default_nib xyscaled(1,terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(thin,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[2])(strokes[2]);
endglyph;
