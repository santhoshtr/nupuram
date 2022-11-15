% ൸ U+0D78 MALAYALAM FRACTION THREE SIXTEENTHS
% muntaani
input glyph;
beginglyph;
z0=(0,0);
z1=(x0 +mw/4, m/3);
z2=(x1+mw/6, m); % pillar top
z3=(x2, m/2);
z4=(x3 + mw/3, 0);
z5=(x4 + mw/4, y0 + m/2);
z6=(x5 + mw/3, m); % first peak
z7=(x6 + mw/3, m/2);
z8=(x7 + mw/3, 0);
z9=(x8 + mw/4, m/2);
z10=(x9 + mw/3, m); % Second peak
z11=(x10 + mw/4, m/2);
z12=(x11 + mw/3, m);
z13=(x12 + mw/3, m/2);
z14 = (x11, 0);
paths[0] = z0..z1..z2;
pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
paths[1] = z2..z3..z4..z5..z6..z7..z8..z9..z10..{down}z11{up}..z12..z13..{dir 235}z14 ;
pen_stroke(
    nib(thinnib)(1, 3,5,7,9, 13)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle 11 of paths[1])(11)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
clearxy;
z0=point infinity of paths[1];
z1=(x0 + 0.8mw , 0);
z2=(x1 , m/2);
paths[2] = z0{right}..{right}z1{dir 120}..z2;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
