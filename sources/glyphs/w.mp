input glyph;
beginglyph;
z0=(0, s);
z1=(x0 + sw/3, 0);
z2=(x1 + sw/3, y0);
z3=(x2 + sw/3, y1);
z4=(x3 + sw/4, y0);

paths[0] = z0{dir -60}..z1 ;
paths[1] = z1{dir 60}..z2 ;
paths[2] = z2..{dir -60}z3 ;
paths[3] = z3 ..{dir 110}z4 ;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(terminalnib rotated terminalangle infinity of paths[1])(0)
    nib(thinterminalnib rotated 0)(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);
endglyph;
