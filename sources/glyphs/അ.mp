input glyph;
beginglyph;
z0 = ( x1 + 0.3m + thick/2, 0);
z1 = ( 0, y0 + m/1.667);
z2 = ( x1 + 0.5mw, y1 + m/2); % top
z3 = ( x2 + 0.2mw, y2-m/1.667); % <
z4 = ( x3 + 0.25mw, y3-m/4);
z5 = ( x4 - 0.25mw, y4-m/4);
z6 = ( x5 - mw/3, y5 + m/2.5);
z7 = ( x6 + mw/3, y6 + m/2);   % top
z8 = ( x7 + mw/2, y7-m/2.5);
z9 = ( x8, y8 - m/2);

z10 = ( x9, y9 + m/2);
z11= ( x10 + mw/2, y10 + m/2);
z12= ( x11 + mw/3, y11 - m/2);
z13= ( x12 - mw/3, y12 - m/2);
z14= ( x13 - mw/4, y13 + m/3);


paths[0] = z0..z1..z2..{dir 180}z3{dir -10}..z4..z5..{up}z6..z7..{down}z8---z9;
paths[1] =z9---z10{up}..z11..z12..{left}z13{left}..{dir 80}z14;
z15 = point 2.75 of paths[1];
paths[1] := paths[1] ..  z15 ;
pen_stroke(
    nib(thicknib rotated 0 )(2, 3, 5 )
    nib(thinnib rotated 0 )(1, 4, 6, 8)
    nib(terminalnib rotated 60)(0)
    nib(thinterminalnib rotated terminalangle 3 of paths[0])(3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 3, 6 )
    nib(thinnib rotated 0 )(1, 3, 5 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
