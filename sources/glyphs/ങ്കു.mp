input glyph;
beginglyph;
z0=(mw/2, 0.6m);
z1=(x0 + mw/3, y0 + 0.4m);
z2=(x1 + mw/3, y1 - 0.5m);
z3=(x2 - mw/3, y2 - 0.5m);
z4=(x3 - mw/3, y3 + 0.4m);
z5=(x4 - mw/4, y4 - 0.4m);
z6=(x5 - mw/4, y5 + 0.2m);
z7=(x6 + mw/4, y6 + 0.3m);
z8=(x7 + mw, y7 + 0.1m);
z9=(x8 + mw/4, y8 - 0.2m);
z10=(x8, y8 - 0.35m);
z11=(x10 + mw/3, y10 - 0.17m);
z12=(x2, y10 - 0.35m);

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4{down}..z5..z6..z7 .. z8 ..z9{down}..{left}z10{right}..z11..{dir 150}z12 ;
pen_stroke(
    nib(thicknib)(1, 3)
    nib(thinnib)(0,2, 4, 6, 9, 11)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle 4 of paths[0])(4)
    nib(terminalnib rotated terminalangle 10 of paths[0])(10)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0 = (xpart(point 6 of paths[0]), m/2);
z1 = (x0+ mw/4, m);
z2 = point 0 of paths[0];
paths[1] := z0{dir 110}.. z1..{down}z2;
pen_stroke(
    nib(thicknib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor("vc", z2);

endglyph;
