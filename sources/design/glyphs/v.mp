input glyph;
beginglyph;
w := 0.4s;
z0=(0, s);
z1=(x0 + w/3, y0 - 0.5s);
z2=(x1 + w/4, y1 - 0.5s);
z3=(x2 + 0.8w, y2 + 0.5s);
z4=(x3, y3 + 0.5s);
paths[0] = z0...z1...{dir -45}z2{dir 45}...z3..z4 ;
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 30)(0)
    nib(terminalnib rotated 30)(infinity)
)(paths[0])(strokes[0]);
endglyph;
