input glyph;
beginglyph;

z0=(0, (y1+y3)/2);
z1=((x2+x0)/2, m/2);
z2=(x0+mw/2.25 , y0);
z3=(x1, 0);
z4=(x0, y0);

paths[0] = z0{dir 90}..z1{dir 4}..z2{dir 266}..z3{dir 184}..{dir 90}z0;
paths[0] := reverse paths[0];
pen_stroke(
    nib(thicknib)(1, 3)
    nib(thinnib)(0, 2, 4)
)(paths[0])(strokes[0]);

endglyph;
