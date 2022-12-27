input glyph;
beginglyph;

paths[0] = pa_mouth;
z5=point infinity of paths[0];
z6=(x5 + mw, y5);
z7=(x6+0.2mw, y6 + m/2);
z8=(x7-mw/3, y7 + m/2);
z9=(x8-mw/3, y8 - m/2);
z10=(x9, y5);
paths[1] := z5{dir 30}..z6..z7..z8..z9.. {dir -85}z10;
pen_stroke(
    nib(thicknib)(0, 2, 4, 5, 6)
    nib(thinnib)(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib)(1, 3)
    nib(thinnib)(2,4)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);



% Ra
clearxy;
z0=(0, 0);
z1=(x0- mw/4, m/2);
z2=(x0 + mw/3, y1 + m/2);
z3=(x2 + mw/3, y2-m/2);
z4=(x2, 0);
paths[2] = z0{dir 135} ..z1..{right}z2..z3{dir 260} ..z4;
paths[2] := paths[2] shifted (mw/3, -1.1m ) xscaled 0.66 yscaled 0.66;
paths[3] := paths[2] shifted (0.8mw, 0);

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



endglyph;
