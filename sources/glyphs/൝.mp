% ൝ U+0D5D MALAYALAM FRACTION THREE TWENTIETHS
% muunnumaa
input glyph;
beginglyph;
z0=(0,0);
z1=(x0 +mw/4, m/3);
z2=(x1 + mw/6, m);
z3=(x2 - mw/15, m/2);
z4=(x3 + mw/3, 0);
z5=(x4 + mw/4, y0 + m/2);
z6=(x5 + mw/3, m);
z7=(x6 + mw/3, m/2);
z8=(x7 + mw/3, 0);
z9=(x8 + mw/4, m/2);
z10=(x9 + mw/3, m);
z11=(x10 + mw/4, m/2);
z12=(x11 + mw/3, 0);
z13=(x12 + mw/3, m/2);
z14=(x13 - mw/4 , m);

paths[0] = z0..z1..z2;
paths[1]= z2..z3..z4..z5..z6..z7..z8..z9..z10..z11..z12..z13..z14 ;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1, 3,5,7,9,11,13)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;
