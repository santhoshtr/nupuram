input glyph;
beginglyph;

z0 = (x1 + mw/4, 0);
z1 = ( x9 + mw/3, y0 + m/2); % leftmost
z2 = ( x1 + mw/2.5, y1 + m/2); % top
z3 = ( x2 + mw/2, y2 - m/2);
z4 = ( x3 - mw/4, y3 - m/3); % bottom middle
z5 = ( x4 - mw/4, y4+ m/3);
z6 = ( x5 + mw/2, y2); % second top
z7 = ( x6 + mw/2.5, y6 -m/2);
z8 = ( x4,  -descent); % ra sign starts
z9 = ( 0, y1);
z10 = ( x9 +mw/8, y2);

paths[0] = z0  ..z1..z2{right}.. z3..z4..z5 ..z6{right}..z7..z8..z9..z10  ;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6, )
    nib(thinnib rotated 0 )(1, 3, 5, 7, 9)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 135)(infinity)
)(paths[0])(strokes[0]);

endglyph;
