input glyph;
beginglyph;

z0= (x1 + mw/3, 0);
z1= (0, y0 + mw/2);
z2 = ( x1 + mw/2, y1 + m/2); % top
z3 = ( x2 + mw/2, y1);
z4 = ( x3 - mw/3, 0.1m); % bottom middle
z5 = ( x4 - mw/3, y3);
z6 = ( x5 + mw/2, y2); % second top
z7 = ( x6 + mw/2, y1);
z8 = ( x7-mw/10 , y0); %
paths[0] = (z0  ..z1 ..z2{right}.. z3..{left}z4) slanted tand(-8);
paths[0] := paths[0] && (z4{left}.. z5 ..z6{right}..z7..z8) slanted tand(8);
paths[0] := paths[0] shifted(-tand(-8)*m/2,0);

z9 = ( x4,  -descent); % ra sign starts
z10 = (x1 - mw/3, y1);
z11 = (x10 + mw/8, y2);

paths[0] := paths[0]..z9..z10.. z11  ;
paths[0] := paths[0] shifted(mw/4,0);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6, )
    nib(thinnib rotated 0 )(1, 3, 5, 7,8, 10)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "vc", point 4 of paths[0]);
anchor( "right", point 8 of paths[0]);


endglyph;
