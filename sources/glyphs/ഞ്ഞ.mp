input glyph;
beginglyph;
paths[0] :=left_arch_with_eye;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6)
    nib(thinnib rotated 0 )(1,3, 5 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


z10 = point 5 of paths[0];
z12 = ( x10 + mw/3, y10 + m/2); % top
z13 = ( x12 + mw/2, y12 - m/2);
z14 = ( x13 - mw/4, y13 - m/3); % bottom middle
z15 = ( x14 - mw/4, y14 +  m/3);
z16 = ( x15 + mw/2, y15 +  m/2); % second top
z17 = ( x16 + mw/3, y16-m/2);
z18 = ( x17, y17-m/3); %

paths[1] = z10{up} ..z12 .. z13..z14..z15 ..z16 ..z17---z18;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7, )
    nib(thinnib rotated 0 )(0, 2, 4,6)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


z20 = z17;
z22 = ( x20 + mw/3, y20 + m/2); % top
z23 = ( x22 + mw/2, y22 - m/2);
z24 = ( x23 - mw/4, y23 - m/3); % bottom middle
z25 = ( x24 - mw/4, y24 +  m/3);
z26 = ( x25 + mw/2, y25 +  m/2); % second top
z27 = ( x26 + mw/2.5, y26-m/2);
z28 = ( x27 - mw/3, y27-m/2); %

paths[2] = z20{up} ..z22 .. z23..z24..z25 ..z26 ..z27..z28;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7, )
    nib(thinnib rotated 0 )(0, 2, 4,6)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);


anchor( "right", point 6.8 of paths[2]);
anchor( "bottom", point 6.8 of paths[2]);


endglyph;
