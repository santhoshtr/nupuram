input glyph;
beginglyph;

z0=(0, m);
z1=((x2+x0)/2, y0 + m/4);
z2=(x1 + 0.25mw, y0);
z3=(x1, y2 - m/4);
z4=(x0, y0);

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;
paths[0] := paths[0] slanted tand(4);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0, 2, 4)
)(paths[0])(strokes[0]);

endglyph;
