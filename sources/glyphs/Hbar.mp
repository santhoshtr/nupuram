input glyph;
beginglyph;

z0=(0, X);
z1=(x0, X/2);
z2=(x1, 0);

paths[0] = z0{down} ..z1..{down}z2;
paths[0] := paths[0] shifted (sw/4, 0);
z3=(xpart(point 0 of paths[0]) + 0.6X, X);
z4=(x3, X/2);
z5=(x4, 0);
paths[1] = z3{down} ..z4..{down}z5;

clearxy;
z0 = point 1 of paths[0];
z1 = point 1 of paths[1];
paths[2]:= z0..z1;
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
pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
% Bar
clearxy;
z0 = point 0.5 of paths[0] - (sw/4, 0);
z1 = point 0.5 of paths[1] + (sw/4, 0);;
paths[3]:= z0..z1;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);
endglyph;
