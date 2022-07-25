input glyph;
beginglyph;
w:=0.8X;
z0=(0.9w, 0.8X);
z1=(x0 - w/2, y0 + 0.2X);
z2=(x1 - w/3*0.9, y1 - 0.3X);
z3=(x2 + w/2*0.9, y2 - 0.2X);
z4=(x3 + w/3, y3 - 0.2X);
z5=(x4 - w/2, y4 - 0.25X);
z6=(x5 - w/3, y5 + 0.2X);
paths[0] = z0..z1..z2 ..z3..z4..z5..z6 ;
pen_stroke(
    nib(thicknib rotated 0 )(0,1, 3)
    nib(thinnib rotated 0 )(2, 4)
    nib(terminalnib rotated 60)(0)
    nib(terminalnib rotated 60)(infinity )
)(paths[0])(strokes[0]);


endglyph;
