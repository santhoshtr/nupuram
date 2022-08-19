input glyph;
beginglyph;
z0=(mw/4, -thick/4);
z1=(x0 - mw/6, y0 + m/3);
z2=(x0 + mw/6, y1 + m/4);
z3=(x2 + mw/4, y2 - m/4);
z4=(x2, 0);
z5=(x4, 0);
z6=(x5 + 3/4mw, y5);
z7=(x6, y6 + m/2);
z8=(x7, y7 + m/2);



paths[0] = z0{dir 135}..z1..{right}z2..z3{dir 260}..z4;
paths[1] := z5{dir 30}..{dir 30}z6{dir 30}..z7...{dir 60}z8;
z10= (x1, m - m/6);
z11= (x3, y10);
z12= point 2.25 of paths[1];
paths[2] := z10 .. z11{dir -60}.. z12;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 170)(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", z3);
anchor( "bottom", z6);
anchor( "right", z6);
endglyph;
