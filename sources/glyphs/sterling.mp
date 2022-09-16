input glyph;
beginglyph;
z0 = (0.75s, 0.8X);
z1 = (x0-s/3, X);
z2 = (x1-s/3, s);
z3 = (x2+s/6, s/2);
z4 = (0, 0);
z5 = (x0+s/4, 0);
paths[0] := z0..z1..z2..z3..{dir 200}z4{right}..z5;
pen_stroke(
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
paths[1]=(0,0.75s){dir 20}..(x0,0.8s);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
