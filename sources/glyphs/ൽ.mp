input glyph;
beginglyph;
z0 = (mw/3 + 0.5thick, 0);
z1 = ( x0 - mw/3, y0 + m/2); % leftmost
z2 = ( x1 + mw/2.5, y1 + m/2); % top
z3 = ( x2 + mw/2, y2 - m/2);
z4 = ( x3 - mw/4, y3 - m/3); % bottom middle
z5 = ( x4 - mw/4, y4 +  m/3);
z6 = ( x5 + mw/1.6, y5 + m/2.4); % second top
z7 = ( x6 + mw/1.8, y6 - m/2.4);
z8 = ( x7 - mw/4, y7-m/2.4); % bottom
z9 = ( x8 - mw/4, y8 + m/2);
z10 = ( x9 + mw/4, y9 + m/2);
z11=( x9, ascent + .1m);
paths[0] = z0  ..z1..z2 .. z3..z4..z5 ..z6{right} ..z7..z8..z9..{up}z10{up}..z11;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6, )
    nib(thinnib rotated 0 )(1, 3, 5, 7, 9, 10)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;