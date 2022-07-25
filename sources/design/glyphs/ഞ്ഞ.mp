input glyph;
beginglyph;

z0 =(u, m/3.5);
z1 =(x0 + mw/4, y0 + m/4);
z2=(x1 + mw/4, y1 - m/4);
z3=(x2 - mw/4, y2 - m/4);
z4=(x3 - m/3, y3 + m/2.5);
z5=(x4 + m/2.8, y4 + m/2);
z6=(x5 + m/2.4, y5-m/2);
z7=(x6, y6 - m/3);

paths[0] = z0{up}..z1{right}..z2{down}..z3{left}..z4.. z5..z6 ---z7;
pen_stroke(
    nib(thicknib rotated 0 )(1,3, 5 )
    nib(thinnib rotated 0 )(0, 2, 4, 6)
    nib(terminalnib rotated 135)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

z10 = z6;
z12 = ( x10 + m/3, y10 + m/2); % top
z13 = ( x12 + mw/2, y12 - m/2);
z14 = ( x13 - mw/4, y13 - m/3); % bottom middle
z15 = ( x14 - mw/4, y14 +  m/3);
z16 = ( x15 + mw/2, y15 +  m/2); % second top
z17 = ( x16 + m/3, y16-m/2);
z18 = ( x17, y17-m/3); %

paths[1] = z10{up} ..z12 .. z13..z14..z15 ..z16 ..z17..z18;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7, )
    nib(thinnib rotated 0 )(0, 2, 4,6)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[1])(strokes[1]);


z20 = z17;
z22 = ( x20 + m/3, y20 + m/2); % top
z23 = ( x22 + mw/2, y22 - m/2);
z24 = ( x23 - mw/4, y23 - m/3); % bottom middle
z25 = ( x24 - mw/4, y24 +  m/3);
z26 = ( x25 + mw/2, y25 +  m/2); % second top
z27 = ( x26 + m/2.5, y26-m/2);
z28 = ( x27 - m/3, y27-m/2); %

paths[2] = z20{up} ..z22 .. z23..z24..z25 ..z26 ..z27..z28;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7, )
    nib(thinnib rotated 0 )(0, 2, 4,6)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 135)(infinity)
)(paths[2])(strokes[2]);

endglyph;
