input glyph;
beginglyph;

z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3, y3 - m/4); % bottom of piller

paths[0] = z0..z1.. z2.. z3---z4 ;
paths[0] := paths[0] shifted (mw/3, 0);

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

z11 = point 3 of paths[0];
z12 = ( x11 + mw/2.4, m-thick/2); % top
z13 = ( x12 + mw/3, y12 - m/2);
z14 = ( x13 - mw/4, thick/2); % bottom middle
z15 = ( x14 - mw/4, y14 + m/2.5);
z16 = ( x15 + mw/2, m ); % second top
z17 = ( x16 + mw/2.5, y16 - m/2);
z18 = ( x17 - mw/4, y0);

paths[1] =z11{up}..z12{dir 10}.. z13..z14..z15 ..z16{dir 10}..{down}z17;

pen_stroke(
    nib(thinnib rotated 0 )(2, 4, 6, 8)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


clearxy;
z0 = point 6 of paths[1];
z1 = (xpart(point 1 of paths[1]), -descent*1.2 );
z2 = (xpart(point 2.25 of paths[0]), y1);
z3 = (xpart(point 1 of paths[0]) - mw/3, ypart(point 1 of paths[0]));
z4 = (x3 + mw/10, m);
paths[2] =  z0{dir -90} ..{dir 190}z1  ..{dir 170}z2  ..z3..z4;

pen_stroke(
    nib(thinnib rotated 0 )(3)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", point 0 of paths[1]);
anchor( "bottom", point .6 of paths[2]);
anchor( "right", point .6 of paths[2]);
endglyph;
