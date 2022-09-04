input glyph;
beginglyph;


z0 =(0, m/3.5);
z1 =(x0 + mw/4, y0 + m/4);
z2 = (x1 + mw/4, y1 - m/4);
z3 = ( x2- mw/4, y2 - m/4);
z4 = ( x3 - mw/4 - thick*0.15, y3 + m/2);
z5 = ( x4 + 0.75mw, y4 + m/2 + thick/2); % top
z6 = ( x5 + 0.25mw, y4); % <
z7 = ( x6 + 0.25mw, y6-m/4);
z8 = ( x7 - 0.25mw, y7-m/4);
z9 = ( x8 - mw/3, y8 + m/2.5);
z10 = ( x9 + mw/3, y9 + m/2);   % top
z11 = ( x10 + mw/2, y10-m/2.5);
z12 = ( x11, y11 - m/2);

z20 = ( x11, y11 );
z21 = ( x20 + mw/3, y20 + m/2);
z22 = ( x21 + mw/3, y21 - m/4);
z23 = ( x22 - mw/3, y22 - m/4);



paths[0] = z0{up}..z1{right}..z2{down}..z3{left}..z4{dir 80}..z5..{left}z6;
paths[1] = z6{right}..z7..z8..{up}z9..z10..{down}z11---z12;

paths[2] := subpath(1, 6) of da;
paths[2]:= paths[2] shifted (xpart(point 6 of paths[1]), 0 );

pen_stroke(
    nib(thicknib rotated 0 )(2, 3, 5 )
    nib(thinnib rotated 0 )(2, 4,7,9,11)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thicknib rotated 0 )(0,2,4 )
    nib(thinnib rotated 0 )(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(thicknib rotated 0 )( 1, 3, 5 )
    nib(thinnib rotated 0 )( 0, 2,4,6)
    nib(thinterminalnib rotated  terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle 3 of paths[2])(3)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", point 5 of paths[0]);
anchor( "bottom", point 4.25 of paths[2]);
anchor( "right", point 4.25 of paths[2]);

endglyph;
