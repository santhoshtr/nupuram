input glyph;
beginglyph;
w := 0.7s;
z0=(u, s);
z1=(x0, y0 - s/2);
z2=(x1, y1 - s/2);

paths[0] = z0{dir -80}..z1..{dir -80}z2;
paths[1] = fullcircle scaled (thick*1.2) shifted(x0, 1.33s);
strokes[1] = paths[1];
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

endglyph;
