input glyph;
beginglyph;

z0 = (thick , s);
z1 = (x0  , s/2);
z2 = (x1 + sw/4, thick/4);
z3 = (x0 + .66*sw,s );

paths[1] = z0{dir -100} ..z1.. z2 ..{dir 80}z3;

z4 = (x3 , s );
z5 = (x4 - thick/4 , y1);
z6 = (x5 + thick/4, 0);

paths[0] = z4 ..z5 ..  z6;
paths[0] := paths[0] xyscaled(-1, -1) shifted(s - thick/2, s);
paths[1] := paths[1] xyscaled(-1, -1) shifted(s - thick/2, s);
paths[2] := paths[1] shifted(x4 - thick, 0);
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
pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 0 )(0 )
    nib(thinterminalnib rotated 0 )(infinity )
)(paths[2])(strokes[2]);
endglyph;
