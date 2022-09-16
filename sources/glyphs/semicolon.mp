input glyph;
beginglyph;
soften:=0;
paths[0] = fullcircle scaled (thick*1.5) shifted(thick/2, .8s);
strokes[0] = paths[0];
clearxy;
z0 = (thick/2, -m/6);
z1 = (x0+ 0.05sw, y0 + m/3);
paths[1] = z0{dir 45}.. z1;
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
