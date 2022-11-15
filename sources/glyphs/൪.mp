input glyph;
beginglyph;

z0= (.5thick, 0);
z1=(x0 , y0 + 0.5m);
z2=(x0, y1 + 0.5m);
z3=(x2 + 0.8mw , y2 - 0.4m);
z4=(x3 - mw/4, thick/2); % bottom
z5=(x4 - mw/4, y3);
z6=(x5 + thick , y2 + m/3);

paths[0] = z0  ..z1 .. z2 .. {dir -60}z3 .. z4..z5..{dir 66}z6 ;

pen_stroke(
    nib(thicknib)(0, 2)
    nib(thinnib)(1, 3,5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 4 of paths[0])(4)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
