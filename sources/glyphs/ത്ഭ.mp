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
z8 = ( x7 - mw/3, y0); %
paths[0] = (z0  ..z1 ..z2{right}.. z3..{left}z4) slanted tand(-8);
paths[0] := paths[0] && (z4{left}.. z5 ..z6{right}..z7..z8) slanted tand(8);
paths[0] := paths[0] shifted(-tand(-8)*m/2,0);
paths[0] := subpath(0, 7) of paths[0];

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6, )
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
paths[1] = subpath(0,2) of da shifted(xpart(point infinity of paths[0]), 0);
z3 = ( xpart(point infinity of paths[1]) + mw/3, ypart(point infinity of paths[1]) - m/3);
z4= ( x3 - mw/3, m/2);
z5= ( x4 + mw/3, y4 - .2m);
z6 = ( x5 + mw/6, y5 - .15m);
z7 = ( xpart(point infinity of paths[1]) - mw/6, 0);

paths[1] := paths[1].. z3 ..z4  .. z5{right} ..z6..{dir 160}z7;

pen_stroke(
    nib(thinnib rotated 0 )(1, 3, 5, 6)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", (xpart(point 4 of paths[0]),0));

endglyph;
