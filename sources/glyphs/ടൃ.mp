input glyph;
beginglyph;
z0=  (x4, 0.8m);
z1=  (x5, m);
z2=  (x6, y3 + .275m);
z3 = (x5, y4 + .3m);
z4 = (x5 + mw/3, .2m);
z5 = (x6 + mw/3, -descent*2/3);
z6 = (0, 0);

paths[0] = z0..z1..z2..z3..z4..z5..{up}z6;
paths[0] := paths[0]..{dir -40}(point 4.25 of paths[0]  - (thick*0.12,0));

pen_stroke(
    nib(thicknib)(1,3,5)
    nib(thinnib)(2,4, 6)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor("vc", z1);

endglyph;
