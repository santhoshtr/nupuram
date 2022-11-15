input glyph;
beginglyph;
% This glyph does not slant. Reset slant value
slant := 0;
z0 = (thick/2, -m/6);
z1 = (x0+ 0.05sw, y0 + m/3);
paths[0] = z0{dir 45}.. z1;
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor("bottom", point 1 of paths[0]);
endglyph;
