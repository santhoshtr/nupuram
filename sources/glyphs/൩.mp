input glyph;
beginglyph;
z0=(mw/3+thick/2, 0);
z1=(x0 - mw/3, m/2);
z2=(x1 + mw/4, y1 + m/2);
z3=(x2 + mw/3, y2-m/2);
z4=(x3, y3-m/3);
% Second arch
z5 = z3;
z6 = (x5 + mw/3, y5 + m/3);
z7 = (x6 + mw/4, y6 - m/3);
z8 = (x7 - mw/3, y7 - m/2);
z15=(x8, 0);
z16=(x15 + 0.6mw, y15);

paths[0] = z0 ..z1..{right}z2..z3 ---z4;
paths[1] = z5{up}..z6..z7..z8;
paths[2] = z15{dir 30}..{dir 30}z16 ;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[2])(strokes[2]);
endglyph;
