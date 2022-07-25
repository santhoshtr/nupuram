input glyph;
beginglyph;
path paths[], strokes;
soften := 0;
z0=(0, 0.5s);
z1=(x0 + 0.4sw, y0 + 0.5s);
z2=(x1 + 0.4sw, y1 - 0.5s);
z3=(x2 - 0.4sw, y2 - 0.5s);
z4=(x3 - 0.4sw, y3 + 0.5s);

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;

pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0,2, 4)
)(paths[0])(strokes[0]);
endglyph;
