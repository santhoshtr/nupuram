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
z12 = ( x10 + m/3, y10 + m/2); % top
z13 = ( x12 + mw/2, y12 - m/3);
z14 = ( x13 - mw/4, y13 - m/3); % bottom middle
z15 = ( x14 - mw/4, y14 +  m/3);
z16 = ( x15 + mw/2, y15 +  m/3); % second top
z17 = ( x16 + m/2.5, y16-m/2);
z18 = ( x17 - m/3, 0); %

paths[1] = z10{up} ..z12{right}.. z13..z14..z15 ..z16{right}..z17..{dir 210}z18;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7, )
    nib(thinnib rotated 0 )(0, 2, 4,6)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

z24=(x18, 0);
z25=(x24 - mw/2, 0);
z26=(x24 + 0.6mw, y25);
z27=(x26, y26 + m*0.5);
z28=(x27, y27 + m*0.5);

paths[2] := z25{dir 30}..{dir30}z26{dir 30}..z27...{dir 60}z28;
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", z12);
anchor( "bottom", z26);
anchor( "right", z26);

endglyph;
