input glyph;
beginglyph;
path paths[],strokes;

z0 = (thick/2, m/2);
z1 = (x0 + mw/4, y0 + m/4 -thick);
z2 = (x1 + mw/4, y1 - m/4);
z3 = (x2 - mw/4, y2 - m/4);
z4 = (x3 - mw/3 +thick/2, y3 + m/2);
z5 = (x4 + mw/2, y4 + m/2 - thick/2);
z6 = (x5 + mw/2, y5 - m/4);
z7 = (x6 - 0.25mw, y6 - m/3);
% Right loop
z8 = (x7 + 0.3mw, y7 - m/4);
z9 = (x8 - 0.3mw, y8 - m/5);
z10 = (x0, y9 - 0.2m );
% Tail
z12 = (x0, y10 );
z13 = (x12 + 0.6mw, y12 );
z14 = (x6+0.1m, y13);
paths[0] = z0  .. z1..  z2.. z3  ..z4.. z5.. z6..z7;
paths[1] = z7..z8..z9..{dir 230}z10;
paths[2] = z12{dir 20}..z13{dir -20}..z14;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3,5 )
    nib(thinnib rotated 0 )(0, 2,4,6 )
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 115)(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thicknib rotated 0 )(0,2,3)
    nib(thinnib rotated 0 )(1,2)
    nib(terminalnib rotated 115)(0)
    nib(thinterminalnib rotated 115)(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 115)(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", (x9,0));
anchor( "right", z14);

endglyph;
