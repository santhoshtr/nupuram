input glyph;
beginglyph;
z0=(x1 + mw/6, m);
z1=(mw/3, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y1);
z4=(x3 + mw/2, m);
z5=(x4 + mw/3, m/2);
paths[0] = z0..z1{down}..{right}z2{right}..z3..{dir -10}z4..{down}z5;
z6=(xpart(point 3 of paths[0]), -descent);
z7=(0, m/4);
z8=(x7 + thick/2, m);
paths[0] := paths[0] .. z6..z7..{dir 60}z8;

pen_stroke(
    nib(thicknib)(0, 2)
    nib(thinnib)(1,3, 5,7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor("vc", point 4 of paths[0]);
anchor("bottom", point 5.4 of paths[0]);
anchor("right", point 5.4 of paths[0]);

endglyph;
