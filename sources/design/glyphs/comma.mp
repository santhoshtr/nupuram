input glyph;
beginglyph;
z0 = (thick/2, -m/6);
z1 = (x0+ 0.05sw, y0 + m/3);
paths[0] = z0{dir 45}.. z1;
pen_stroke(
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
endglyph;
