input glyph;
beginglyph;

loop_slant=4;

z0 =(0, m/2);
z1 =(x0 + mw/4, y0);
z2=(x1 + mw/4,  m/4);
z3=(x2 - mw/4, 0);
z4=(x3 - mw/4, 0.4m);
z5=(x4 + m/4, 0.98m);
z6=(x5 + m/2, m/2);


paths[0] = z0 ..z1 ..z2{down}..z3{left}.. z4{up}  .. z5 ..{down}z6;
paths[0]:=paths[0] slanted tand(-loop_slant);
z7 = (xpart(point 6 of paths[0]), m/6);
paths[0]:= paths[0]{down} --- {down}z7;
paths[0]:=paths[0] shifted (thick/4,0);

pen_stroke(
    nib(thicknib rotated 0 )(1,3, 5 )
    nib(thinnib rotated 0 )(0, 2, 4, 6)
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);


paths[1] := subpath(1, 6) of da;
paths[1]:=paths[1] shifted (xpart(point 6 of paths[0]), 0 );
pen_stroke(
    nib(thicknib rotated 0 )( 3, 6 )
    nib(thinnib rotated 0 )(0, 2,4,6 )
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 60)(3)
    nib(terminalnib rotated 60)(infinity)
)(paths[1])(strokes[1]);


endglyph;
