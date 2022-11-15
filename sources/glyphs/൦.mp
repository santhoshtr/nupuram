input glyph;
beginglyph;
soften := 0;
z0=(0, m/2);
z1=((x0 + x2)/2, y0 + 0.5m);
z2=(x1 + mw/3, y0);
z3=(x1, 0);
z4=(x0, y2);

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;

pen_stroke(
    nib(thicknib)(1, 3)
    nib(thinnib)(0,2, 4)
)(paths[0])(strokes[0]);
endglyph;
