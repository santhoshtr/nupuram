input glyph;
beginglyph;
z0=(0, s);
z1=(x0 + thick, s/2);
z2 =(x1, 0);
z3 =(x2 + sw/2 , 0.6s);
z4=(x3, y0);
paths[0] = z0{dir -45}..z1..{dir 270}z2 ;


paths[2] = paths[0] shifted (sw/2, 0);
paths[3] = (z2{dir 50}..z3..{dir 120}z4 ) shifted (xpart(point 0 of paths[2]), 0);
paths[1] = z2{dir 50}.. {dir 70}(point 0.8 of paths[2]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);
endglyph;
