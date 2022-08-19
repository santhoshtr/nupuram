input glyph;
beginglyph;

z0=(x1 + 0.1mw, 0.3m);
z1=(0, y0 + m/4);
z2=(x1 + mw/4, y1 + m/4);
z3=(x2 + mw/4, y2 - m/4);
z4=(x0, thick/4);


paths[0] = z0{dir 130}..z1..{right}z2..z3 .. z4;
paths[0] := paths[0] slanted tand(8);
paths[0] := paths[0] shifted (mw/8, 0);

z5=(0, 0);
z6=(x5 + mw, y5);
z7=(x6, y6 + m/2);
z8=(x7, y7 + m/2);
paths[1] := z5{dir 20}..{dir 20}z6{dir 20}..z7...{dir 60}z8;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 135)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 170)(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", z3);
anchor( "bottom", z6);
anchor( "right", z6);

endglyph;
