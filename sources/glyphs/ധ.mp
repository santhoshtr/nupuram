input glyph;
beginglyph;
z0=(mw/3, m);
z1=(x0 -  mw/3, y0 - m/2);
z2=(x1 +  mw/3, y1 - m/2);
z3=(x2 +  mw/3, y2+ m/2);
z4=(x3, y3+m/3); % bottom of piller
z5=(x3, y3);
z6=(x5 +  mw/3, y5 - m/2); % Top of second arch
z7=(x6 +  mw/3, y6 + m/2);
z8=(x7 -  mw/3, y7 + m/2);

paths[0] = z0..z1..{dir 10}z2.. z3---z4;
paths[1] = z4---z5..z6{dir -10}..z7..z8;
pen_stroke(
    nib(thicknib)(0, 2)
    nib(thinnib)(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib)(0, 2, 4, 6)
    nib(thinnib)(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
anchor("vc", (xpart(point 3 of paths[0]),0));
anchor("bottom", point 2.2 of paths[1]);
anchor("right", point 2.2 of paths[1]);
endglyph;
