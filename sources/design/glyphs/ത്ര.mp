input glyph;
beginglyph;

z0 = (m/1.5 , 0);
z1 = ( x0 - m/3, y0 + m/2); % leftmost
z2 = ( x1 + m/2.5, y1 + m/2); % top
z3 = ( x2 + m/2, y2 - m/2);
z4 = ( x3 - m/4, y3 - m/3); % bottom middle
z5 = ( x4 - m/4, y4+ m/3);
z6 = ( x5 + m/2, y2); % second top
z7 = ( x6 + m/2.5, y6 -m/2);
z8 = ( x4, y0 - descent); % ra sign starts
z9 = ( x1 - m/4, y1);
z10 = ( x9 +m/4, y2);

paths[0] = z0  ..z1..z2{right}.. z3..z4..z5 ..z6{right}..z7..z8..z9..z10  ;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4,6, )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5, 7, 9)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
