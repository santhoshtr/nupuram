input glyph;
beginglyph;
z0= (x1 + mw/3, 0);
z1= (0, y0 + mw/2);
z2 = (x1 + mw/2, y1 + m/2); % top
z3 = (x2 + mw/2, y1);
z4 = (x3 - mw/3, 0.1m); % bottom middle
z5 = (x4 - mw/3, y3);
z6 = (x5 + mw/2, y2); % second top
z7 = (x6 + mw/2, y1);
z8 = (x7 - mw/3, y0); %
paths[0] = (z0  ..z1 ..z2{right}.. z3..{left}z4) slanted tand(-8);
paths[0] := paths[0] && (z4{left}.. z5 ..z6{right}..z7..z8) slanted tand(8);
paths[0] := paths[0] shifted(-tand(-8)*m/2,0);

pen_stroke(
    nib(thicknib)(0, 2, 4,6,)
    nib(thinnib)(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor("vc", point 4 of paths[0]);
anchor("bottom", (xpart(point 7.5 of paths[0]), 0));
endglyph;
