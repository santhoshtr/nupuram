input glyph;
beginglyph;
z0=(x1 + mw/4, m);
z1=(0, y0 - m/2);
z2=(x1 + mw/4, 0);
z3=(x2 + mw/4, y1);
paths[0] = z0{dir -140}..z1..z2..z3..cycle;
paths[0] := paths[0] slanted tand(4);
paths[0] := subpath(0.1, 2.7) of paths[0];
paths[0] := paths[0] .. subpath(1.3, 4) of right_arch shifted(xpart(point 3 of paths[0])+thick/4, 0);

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 5)
    nib(thinnib rotated 0 )(1,3,4, 6)
    nib(terminalnib rotated 135)(0)
    nib(terminalnib rotated 135)(infinity)
)(paths[0])( strokes[0]);

endglyph;
