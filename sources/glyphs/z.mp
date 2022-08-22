input glyph;
beginglyph;

z0=(0, s );
z1=(x0 + .75sw, s);
z2=(x0, 0);
z3=(x1, 0);

paths[0] = z0{dir -20}..{dir 20}z1;
paths[1] = z1{dir -110}..{dir 260}z2;
paths[2] = z2{dir 20}..{dir -20}z3 ;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

endglyph;
