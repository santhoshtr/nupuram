input glyph;
beginglyph;
z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3, y3 - m/4); % bottom of piller
paths[0] = z0..z1..{right}z2.. z3---z4 ;

z5=(x3, y3);
z6=(x5 + mw/2.5, m-thick/2); % Top of second arch
z7=(x6 + mw/2.5, y6 - m/3);
z8=(x7 - mw/4, y7 - m/2);
z9=(x8 - mw/4, y8 + m/2);
z10=(x9, ascent);


paths[1] = z5{up}..z6..z7..z8 .. z9..{dir 100}z10;
paths[1] := paths[1] slanted tand(8) shifted (-tand(8)*mw/3, 0);

pen_stroke(
    nib(thicknib)(0, 2)
    nib(thinnib)(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib)(1, 3)
    nib(thinnib)(2,4, 5)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
