input glyph;
beginglyph;
path paths[],strokes;

z0 = (0.25mw, 0.6m);
z1 = (x0 +  0.2mw, y0 + 0.2m );
z2 = (x1 -  0.2mw, y1 + 0.2m);
z3 = (x2 -  0.2mw, y2 - m/4);
z4 = (x3 + mw/2, y3 - m/3);
z5 = (x4 + mw/2, y4 - m/3);
z6 = (x5 - mw/2, y5 - m/3);
z7 = (x6 - mw/2, y6 + m/3);
z8 = (x7 + mw/2, y7 + m/3);
z9 = (x8 + mw/2, y8 + m/3);
z10 = (x9 -  0.2mw, y2);
z11 = (x10 - 0.2mw, y10 - 0.2m);
z12 = (x11 + 0.2mw, y11 - 0.2m);
paths[0] = z0{right} .. z1..z2..z3..z4..{down}z5{down}..{left}z6{left}..{up}z7{up}..z8..z9..z10..z11..{right}z12 ;

pen_stroke(
    nib(thicknib rotated 0 )(2,6)
    nib(thinnib rotated 0 )(1,3,4,5,7,8,9,11 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
clearxy;
z0 = (xpart(point 0 of paths[0]), 0);
z1 = (xpart(point 4 of paths[0]), 0);
z2 = (xpart(point infinity of paths[0]), 0);
paths[1] = z0{dir 100}..{dir -80}z1{dir 80}..{dir -100}z2;
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle 1 of paths[0])(1)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[1])(strokes[1]);
endglyph;
