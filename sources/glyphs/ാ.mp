input glyph;
beginglyph;
slant:= tand(-4);
h_correction :=  thick/4;
z0=(thick/2, m/2);
z1=(x0 + mw/3, m - h_correction);
z2=(x1 + mw/3, y0);
z3=(x2 - mw/4,  h_correction);
paths[0] = z0 .. z1.. z2 .. z3 ..  cycle;
paths[0] := paths[0] slanted slant;
paths[0]:= paths[0] shifted (-slant*m/2, 0);
paths[0]:= subpath(.2, 3) of paths[0]  .. (x0, y0-m/4);

pen_stroke(
    nib(thinnib rotated 0 )(2,4 )
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 30)(infinity)
)(paths[0])(strokes[0]);
endglyph;
