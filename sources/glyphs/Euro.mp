input glyph;
beginglyph;
z0 = (s, 0.8X);
z1 = (x0-s/3, X);
z2 = (x1-s/2,X/2);
z3 = (x1, 0);
z4 = (x0, 0.2X);
paths[0] := z0..z1..z2..z3..z4;
pen_stroke(
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

paths[1]=(0,0.8s){dir 20}..(x0*0.8,0.85s);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
paths[2]=(0,0.55s){dir 20}..(x0*0.7,0.6s);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
