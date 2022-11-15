% ൜ U+0D5C MALAYALAM FRACTION ONE TENTH
% rantumaa
input glyph;
beginglyph;
z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, m);
z3=(x2 + mw/3, m/2);
z4=(x3 + mw/3, 0);
z5=(x4 + mw/4, m/2);
z6=(x5 + mw/3, m);
z7=(x6 + mw/4, m/2);
z8=(x7 + mw/3, 0);
z9=(x8 + mw/3, m/2);
z10=(x9-mw/4 , m);

paths[0] = z0..z1..z2..z3..z4..z5..z6..z7..z8..z9..z10 ;
pen_stroke(
    nib(thinnib)(1, 3,5,7,9)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


endglyph;
