input glyph;
beginglyph;

z0 = (.75*sw + thick/2 , s/2);
z1 = (x0 - .75*sw/2 , s - thick/4);
z2 = (x0 - .75*sw , y1 -(phi-1)*s );
z3 = (x1, thick/4);
z4 = (x2 + .75*sw, y0+thick);

paths[0] = z0{dir 90} ..z1.. z2 ..z3..{dir 80}z4;

z5 = (x0 + thick/2 , s );
z6 = (x5 - thick/4 , y2);
z7 = (x6 - sw/6, y6 - 0.9s);
z8 = (x2, y7 + s/4);

paths[1] = z5 .. z6 ..  z7 .. z8;

pen_stroke(
    nib(thicknib rotated 0 )(1,3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 0 )(0 )
    nib(thinterminalnib rotated 0 )(infinity )
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0 )(0 )
    nib(terminalnib rotated 30 )(infinity )
)(paths[1])(strokes[1]);

endglyph;
