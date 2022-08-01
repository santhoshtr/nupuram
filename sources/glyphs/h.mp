input glyph;
beginglyph;

z0 = (3/4thick , s);
z1 = (x0 - thick/4 , s/2);
z2 = (x1 + sw/4, thick/4);
z3 = (x0 + .75*sw,s );

paths[1] = z0 ..z1.. z2 ..{dir 80}z3;

z4 = (x3 , X );
z5 = (x4, y4 - .75*X);
z6 = (x5, 0);

paths[0] = z4{dir -80} ..z5 .. {dir -80} z6;
paths[0] := paths[0] xyscaled(-1, -1) shifted(s - thick/2, X);
paths[1] := paths[1] xyscaled(-1, -1) shifted(s - thick/2, s);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0 )(0 )
    nib(terminalnib rotated 30 )(infinity )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 0 )(0 )
    nib(thinterminalnib rotated 0 )(infinity )
)(paths[1])(strokes[1]);
endglyph;
