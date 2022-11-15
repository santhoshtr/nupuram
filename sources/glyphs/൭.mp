input glyph;
beginglyph;
path paths[],strokes;

z0=(x3 + thick*0.15, y3);
z1=(x0 + mw/2, y3 - m/4);
z2=(x1 - mw/5, 0);
z3=(0, m/2);
z4=(x3 + mw/2, m);
z5=(x4 + mw/2, m/2);
z6=(x5 - mw/4, 0);
z7 = (x2, -descent);

paths[0] = z0 .. z1{down}..z2{left}..z3.. z4..{down}z5 .. z6 ..z7;

pen_stroke(
    nib(thicknib)(0,4)
    nib(thinnib)(1,3,5,6,7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
