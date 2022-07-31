input glyph;
beginglyph;

z0 = ((phi-1)*sw + thick/2 , s/2);
z1 = (x0 - (phi-1)*sw/2 , s - thick/4);
z2 = (x0 - (phi-1)*sw , y1 -(phi-1)*s );
z3 = (x1, thick/4);
z4 = (x2 + (phi-1)*sw, y0+thick);

paths[1] = z0{dir 90} ..z1.. z2 ..z3..{dir 80}z4;

z5 = (thick/2   , X );
z6 = (x5   , y2);
z7 = (x6 , 0);

paths[0] = z5{dir -80}  ..z6 ..  {dir -80}z7;

paths[1] := paths[1] xyscaled(-1, 1) shifted(s- thick/2, 0);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0 )(0 )
    nib(terminalnib rotated 30 )(infinity )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1,3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 0 )(0 )
    nib(thinterminalnib rotated 0 )(infinity )
)(paths[1])(strokes[1]);



endglyph;
