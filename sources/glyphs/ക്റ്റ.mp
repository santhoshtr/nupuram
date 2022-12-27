input glyph;
beginglyph;

z0=(mw/2, 0.6m);
z1=(x0 + mw/3, y0 + 0.4m);
z2=(x1 + mw/3, y1 - m/2);
z3=(x2 - mw/3, y2 - m/2);
z4=(x3 - mw/3, y3 + 0.4m);
z5=(x4 - mw/4, y4 - 0.4m);
z6=(x5 - mw/4, y5 + 0.2m);
z7=(x6 + mw/4, y6 + 0.3m);
z8=(x2 + mw/4, y7);
z9=(x8 + mw/4, y8 - 0.3m);
z10=(x9 - mw/3, 0);

paths[0] := z0{up}..{right}z1..{down}z2..z3{left}..{up}z4{down}..z5..z6..z7{dir 18} .. z8{dir -18}..z9..z10 ;
pen_stroke(
    nib(thicknib)(1, 3)
    nib(thinnib)(0,2, 4, 6, 9)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle 4 of paths[0])(4)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


% Ra
clearxy;
z0=(0, 0);
z1=(x0- mw/4, m/2);
z2=(x0 + mw/3, y1 + m/2);
z3=(x2 + mw/3, y2-m/2);
z4=(x2, 0);
paths[2] = z0{dir 135} ..z1..{right}z2..z3{dir 260} ..z4;
paths[2] := paths[2] shifted (mw/3, -1.1m ) xscaled 0.75 yscaled 0.7;
paths[3] := paths[2] shifted (mw, 0);

pen_stroke(
    nib(thicknib)(0, 2,5, 6)
    nib(thinnib)(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

pen_stroke(
    nib(thicknib)(0, 2,5, 6)
    nib(thinnib)(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor("vc", z1);


endglyph;
