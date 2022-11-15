input glyph;
beginglyph;
z0=(0, s);
z1=(x0 + 0.8*sw/3, s/2);
z2 =(x0 + 0.8*sw/2, 0);
z3 =(x2 + 0.8*sw/2 , 0.6s);
z4=(x3, y0 + 0.05s);
paths[0] = z0{dir -45}..z1..{dir -80}z2 ;
paths[1] = z2{dir 45}..z3..{dir 110}z4 ;
pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
