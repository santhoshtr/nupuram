input glyph;

beginglyph;

z0 = (m/3-thick/2 , m - m/4 + thick/2);
z1 = (x0 + mw/3, m);
z2 = (x1 + mw/4, y1 - m/2);
z3 = (x2 - mw/2, 0);
z4 = (x3 - mw/3, y3 + m/3);
z5 = (x4 + mw/3, y4 + m/3);
z7 = (x5 + mw/3, y5 - m/3);
z8 = (x7 + mw/3, y3);
z9 = (x8 + mw/3, y8+ m/2);
z10 = (x9 - mw/4, y9 + m/2);
paths[0] = z0  ..z1..z2..z3..z4..z5 ..z7..z8..z9.. z10;

pen_stroke(
    nib(thicknib rotated 0 )(1,3,5,7 )
    nib(thinnib rotated 0 )(2,4,6, 8)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

% Shoe
clearxy;
z0 = point 7 of paths[0];
z1 = (xpart(point 5 of paths[0]), -descent*1.2) ;
z2 = (xpart(point 7.75 of paths[0]), y1) ;
z3 = point 7.75 of paths[0];
paths[1] := z0 ..{dir 200}z1{dir 20}..{dir 20}z2{dir 110}..z3;
pen_stroke(
    nib(thicknib rotated 0 )(3)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle 1 of paths[1])(1)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", (x1,0));
anchor( "bottom", point 2 of paths[1]);
anchor( "right", point 2 of paths[1]);;

endglyph;

