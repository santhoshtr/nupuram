input glyph;
beginglyph;
z0=(2/3mw+thick/2, 0.8m);
z1=(x0 - mw/3, m);
z2=(x1 - mw/3, y1 - m/4);
z3=(x2 + mw/3, m/2);
z4=(x3+mw/3, y3 - m/4);
z5=(x4 - mw/3, 0);
z6=(x5 - mw/5, y5 + thick/2 );

z10 = z5;
z11 = (x4  + thick/2, y10 - m/4);
z12 = (x3, y11 - m/4);
z13 = (x2 - thick/2, y12 + m/4);

paths[0] = z0..z1..z2 ..z3..z4..z5.. z6 ;
paths[1] = z10{right}  ..z11..z12 .. z13 ;

pen_stroke(
    nib(thicknib rotated 0 )(0,1, 3)
    nib(thinnib rotated 0 )(2, 4)
    nib(terminalnib rotated 60)(0)
    nib(terminalnib rotated 80)(infinity )
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 60)(0)
    nib(terminalnib rotated 60)(infinity )
)(paths[1])(strokes[1]);
% strokes[0]:=strokes[0] shifted(0, m/3);
% strokes[1]:=strokes[1] shifted(0, m/3);
anchor( "right", z11);
anchor( "bottom", z12);

endglyph;
