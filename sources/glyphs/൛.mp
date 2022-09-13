input glyph;
beginglyph;
z0=(0, 0);
z1=(x0 + 0.05mw , m/2);
z2=(x0, m);
paths[0] = z0..z1..z2;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])( strokes[0]);

clearxy;
z0 = point infinity of paths[0];
z1 = (x0+ 2/3mw, y0);
paths[1] = z0{dir -20}..z1;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])( strokes[1]);
clearxy;
z0 = point infinity of paths[1];
z1 = (x0 - mw/3, y0-m/2);
z2 = (x1 + mw/3, y1-m/2);
z3 = (x2 + mw/2, y1);
z4 = (x3 - mw/4, y0);
paths[2] = z0..z1..z2..z3..z4;
pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])( strokes[2]);
endglyph;
