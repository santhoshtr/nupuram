input glyph;
beginglyph;
z0=(0.9sw, 0.8s);
z1=(x0 - sw/2 , s-thick/4);
z2=(x1 - sw/3*0.9 , y1 - 0.3s);
z3=(x2 + sw/2*0.9, y2 - 0.2s);
z4=(x3 + sw/3, y3 - 0.2s);
z5=(x4 - sw/2, thick/4);
z6=(x5 - sw/3, y5 + 0.2s);
paths[0] = z0..z1..z2 ..z3..z4..z5..z6 ;
pen_stroke(
    nib(thicknib rotated 0 )(0,1, 3)
    nib(thinnib rotated 0 )(2, 4)
    nib(terminalnib rotated 60)(0)
    nib(terminalnib rotated 60)(infinity )
)(paths[0])(strokes[0]);


endglyph;
