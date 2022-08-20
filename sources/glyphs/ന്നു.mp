input glyph;
beginglyph;

z3=(mw/3, 0);
z4=(x3 - mw/3, y3 + m/2);
z5=(x4 + mw/3, y4 +0.4m);
z6=(x5 + mw/3, y5 - m/2);
z7=(x6, y6 - m/3);
% Second arch
z11 = z6;
z12 = (x11 + mw/4, y11 + m/3);
z13 = (x12 + mw/4, y12 - m/3);
z14 = (x13, y13 - m/3);
z15=z13;
z16=(x15 + mw/2, m);
z17=(x16 + mw/3, y16 - m/2);
z18=(x17 - mw/3, y17 - m/2);
z19= ( x18 - mw/4, y18 + .3m);
z20= ( x19 + 0.55mw, y17);

paths[0] =  z3{dir 150} ..z4.. z5..z6 ---z7;
paths[1] = z11{up}..z12..z13---z14;
paths[2] = z15{up}..z16..z17...z18..z19..z20;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2,4,6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 60)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(0, 2,4, 6)
 )(paths[2])(strokes[2]);
endglyph;
