input glyph;
beginglyph;

z0=(.5thick, -thick/2);
z1=(x0, y0 + 0.5m);
z2=(x0, y1 + 0.5m);
z3=(x2 + 0.8mw , y2 - 0.4m);
z4=(x3 - mw/4, 0); % bottom
z5=(x4 - mw/4, y4+ m/4);
z6=(x5 + mw/3, y5 + m/4);
z7=(x6 + 0.6mw, y6 - m/4);
z8=(x7 + mw/4, y7 + m/4);
z9=(x8 - mw/4, y8 + m/4);
z10=(x9 - mw/4, y6 - m/6.6);

paths[0] = z0  ..z1 .. z2 .. {dir -60}z3 .. z4..z5..z6...z7..z8..z9..z10 ;

pen_stroke(
    nib(thicknib)(0, 2, 9)
    nib(thinnib)(1, 3, 5,7, 8, 10)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 4 of paths[0])(4)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
