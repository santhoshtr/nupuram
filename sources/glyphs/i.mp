input glyph;
beginglyph;
z0= (0.05sw, s);
z1=(0,  s/2);
z2=(x0 + 0.05sw, 0);

paths[0] = z0..z1{down}..{dir -60}z2;
paths[1] = fullcircle scaled (thick*1.5) shifted(x0, 1.33s);

pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
strokes[1] = paths[1];
endglyph;
