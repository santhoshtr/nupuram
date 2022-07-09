input glyph;

beginglyph;
path paths[], strokes[], r;

z0 = (m/2 , 0);
z1 = ( x0 - m/3, y0 + m/2); % leftmost
z2 = ( x1 + m/2, y1 + m/2); % top
z3 = ( x2 + m/2, y2 - m/2);
z4 = ( x3 - m/3, y3 - m/2); % bottom middle
z5 = ( x4 - m/4, y4 + m/2);
z6 = ( x5 + m/2, y5 + m/2); % second top
z7 = ( x6 + m/2, y6 - m/2);
z8 = ( x7 - m/3, y7 - m/2); % end

pickup nib;

paths[0]:= z0..z1..z2..{dir 285}z3..z4..z5{dir 75}..z6..z7..z8;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4,6, )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5, 7)
    nib(default_nib xyscaled(1,.1) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(1,.1) rotated 90)(infinity) % Sharp cut
)(paths[0])(strokes[0]);


endglyph;
end