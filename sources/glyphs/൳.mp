input glyph;
beginglyph;
soften:=0;
z0=(0.3mw, 0.8m);
z1=(x0 + 0.3mw, y0 - 0.3m);
z2=(x1 - 0.3mw, y1 - 0.3m);
z3=(x2 - 0.3mw, y2 + 0.3m);
z4=(x3 + 0.3mw, y3 + 0.3m);
z5=(x4 + mw, y0);

paths[0] = z0{right}..{down}z1..{left}z2..z3{up}.. z4..{dir 20}z5;

pen_stroke(
    nib(thicknib rotated 0 )(2)
    nib(thinterminalnib rotated 90)(0 )
    nib(thinnib rotated 0 )(1,3,4)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity )
)(paths[0])(strokes[0]);
endglyph;
