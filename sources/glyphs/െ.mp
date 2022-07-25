input glyph;
beginglyph;

z0=(thick/2, 0.4m);
z1=(x0 + 0.3mw, y0 + 0.2m);
z2=(x1 + 0.3mw, y1 - 0.3m);
z3=(x2 - 0.3mw, 0);
z4=(x0,  y3 + 0.5m);
z5=(x4 + 0.5mw, y4 + 0.5m);
z6=(x5 + 0.5mw, y5 - .5m);
z7=(x6 - 0.3mw, y6 - .5m);

paths[0] = z0{dir 60}..{right}z1..{down}z2..z3{left}..{up}z4..z5{right} ..{down}z6{down}..{dir 200}z7;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0, 2, 4, 6)
    nib(thinterminalnib rotated 90)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);

endglyph;
