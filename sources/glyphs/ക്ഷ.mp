input glyph;
beginglyph;

z0=(0.5mw, 0.6m);
z1=(x0 + mw/3, y0 + 0.4m);
z2=(x1 + mw/3, y1 - 0.5m);
z3=(x2 - mw/3, y2 - 0.5m);
z4=(x3 - mw/3, y3 + 0.4m);
z5=(x4 - mw/4, y4 - 0.4m);
z6=(x5 - mw/4, y5 + 0.2m);
z7=(x6 + mw/4, y6 + 0.3m);
z8=(x7 + mw, y7  );
z9=(x8 + 0.2m, y8 - 0.3m);
z10=(x9 - 0.2m, y9 - 0.2m);


z15=(x10, 0);
z16=(x15 + mw, y15);
z17=(x16, y16 + m*0.5);
z18=(x17, y17 + m*0.5);
z19 = z18;
z20 = (x19 - mw/3, y19-0.5m);
z21 = (x20 - mw/3, y20 + 0.5m);
z22 = (x21 + mw/3, y21 - 0.4m);
z23 = (x22, y22- 0.6m);

paths[0] := z0{up}..{right}z1..{down}z2..z3{left}..{up}z4{down}..z5..z6..z7..tension 1.5..z8..z9..{dir 210}z10 ;
paths[1] = z15{dir 20}..{dir 20}z16{dir 20}..z17...{dir 60}z18;
paths[2] = z19{dir 250}..z20 ..z21 ..{down}z22..z23;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0,2, 4, 6, 9)
     nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 45)(4)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 160)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1,2)
    nib(thinnib rotated 0 )( 3)
    nib(terminalnib rotated 160)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[2])(strokes[2]);
anchor( "vc", z1);
anchor( "bottom", z16);
anchor( "right", z16);

endglyph;
