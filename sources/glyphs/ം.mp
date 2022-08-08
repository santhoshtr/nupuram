input glyph;
beginglyph;
path paths[], strokes;
soften := 0;
z0=(thick/2, m/4);
z1=(x0 + 0.2mw, y0 + m/4);
z2=(x1 + 0.2mw, y1 - m/4);
z3=(x2 - 0.2mw, y2 - m/4);
z4=(x3 - 0.2mw, y3 + m/4);

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;
paths[0] := paths[0] slanted tand(4);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0, 2, 4)
)(paths[0])(strokes[0]);

endglyph;
