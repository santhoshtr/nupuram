input glyph;
beginglyph;
z0=(mw/10, X);
z1=(x0, 0);
z2=(x0-mw/6, 2/3X);
paths[0] = z0{dir -80}..z1;
paths[1] = z2..{up}z0;

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
lbearing:=2*lbearing;
rbearing:=2*rbearing;
endglyph;