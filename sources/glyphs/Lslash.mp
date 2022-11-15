input glyph;
beginglyph;
z0=(0, X);
z1=(x0, X/2);
z2=(x1, 0);

paths[0] = z0{down} ..z1..{down}z2;
paths[0] := paths[0] shifted (sw/4,0);

z3=(xpart(point 2 of l_vstem), thick*thin/2);
z4=(x3 + Xw/2, y3);

paths[1] = z3{dir 10}..{dir 10}z4;
paths[1] := paths[1] shifted (sw/4,0);
pen_stroke(
    nib(thicknib)(0, 2, 3, 5)
    nib(thinnib)(1,2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

% Slash
clearxy;
z0=(0, ypart(point 1 of paths[0]));
z1=(x0+sw/2, y0 +s/4);
paths[2]=z0..z1;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
