input glyph;
beginglyph;

z0=(0, m);
z1=((x2+x0)/2, y0 + m/4);
z2=(x1 + 0.25mw, y0);
z3=(x1, y2 - m/4);
z4=(x0, y0);

paths[0]:= z0{dir 90}..z1{dir 4}..z2{dir 266}..z3{dir 184}..{dir 90}z0;
pen_stroke(
    nib(thicknib)(1, 3)
    nib(thinnib)(0, 2, 4)
)(paths[0])(strokes[0]);

endglyph;
