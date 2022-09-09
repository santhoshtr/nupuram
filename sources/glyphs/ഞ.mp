input glyph;
beginglyph;

paths[0] := left_arch_with_eye;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6)
    nib(thinnib rotated 0 )(1,3, 5 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0 = point 5 of paths[0];
z1 = ( x0 + m/3, y0 + m/2); % top
z2 = ( x1 + mw/2, y1 - m/2);
z3 = ( x2 - mw/4, y2 - m/3); % bottom middle
z4 = ( x3 - mw/4, y3 +  m/3);
z5 = ( x4 + mw/2, y4 +  m/2); % second top
z6 = ( x5 + m/2.5, y5-m/2);
z7 = ( x6 - m/3, y6-m/2); %

paths[1] = z0{up} ..z1{right}.. z2..z3..z4 ..z5{right}..z6..z7;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7, )
    nib(thinnib rotated 0 )(0, 2, 4,6)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


anchor( "right", point 6.8 of paths[1]);
anchor( "bottom", point 6.8 of paths[1]);

endglyph;
