input glyph;
beginglyph;


paths[0] := left_arch_with_eye;
pen_stroke(
    nib(thicknib)(0, 2, 4, 6)
    nib(thinnib)(1,3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0=point 5 of paths[0];
z1=(x0 + mw/2, y0 + m/2); % Top of third arch
z2=(x1 + mw/3, y1 - m/2);
z3=(x2 - mw/3, y2 - m/2);
z4= (x3 - mw/4, y3 + .3m);
z5= (x4 + mw/2, y4 +  m/3);
z6= (x5 + m/3, y5 - m/3);
z7= (x6 - 0.7mw, -descent);

paths[1] = z0{up}..z1..z2...z3..z4..z5..z6..{dir 160}z7;

pen_stroke(
    nib(thicknib)(3, 6)
    nib(thinnib)(2,4,6)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle 3 of paths[1])(3)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;
