input glyph;
beginglyph;

z0 =(u, m/3.5);
z1 =(x0 + mw/4, y0 + m/4);
z2=(x1 + mw/4, y1 - m/4);
z3=(x2 - mw/4, y2 - m/4);
z4=(x3 - mw/3, y3 + m/2.5);
z5=(x4 + mw/2.8, y4 + m/2);
z6=(x5 + mw/2.4, y5-m/2);
z7=(x6, y6 - m/3);
% Second arch
z11 = z6;
z12 = (x11 + mw/4, y11 + m/2.5);
z13 = (x12 + mw/4, y12 - m/3);
z14 = (x13, y13 - m/2.5);
z15=z13;
z16=(x15 + m/3, y15+m/2);
z17=(x16 + m/3, y16 - m/2);
z18=(x17 - m/3, y17 - m/2);
paths[0] = z0{up}..z1{right}..z2{down}..z3{left}..z4.. z5..z6 ---z7;
paths[1] = z11{up}..z12..z13---z14;
paths[2] = z15{up}..z16..z17...z18;
pen_stroke(
    nib(thicknib rotated 0 )(1,3, 5 )
    nib(thinnib rotated 0 )(0, 2, 4, 6)
    nib(terminalnib rotated 135)(0)
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
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[2])(strokes[2]);

paths[3] = paths[0] shifted (mw/2,  -.8m  ) xscaled 0.75 yscaled 0.75;
paths[4] = paths[1] shifted (mw/2, -.8m  ) xscaled 0.75 yscaled 0.75;
paths[5] = paths[2] shifted (mw/2, -.8m  ) xscaled 0.75 yscaled 0.75;
strokes[3] = strokes[0] shifted (mw/2,  -.8m  ) xscaled 0.75 yscaled 0.75;
strokes[4] = strokes[1] shifted (mw/2, -.8m  ) xscaled 0.75 yscaled 0.75;
strokes[5] = strokes[2] shifted (mw/2, -.8m  ) xscaled 0.75 yscaled 0.75;
endglyph;
