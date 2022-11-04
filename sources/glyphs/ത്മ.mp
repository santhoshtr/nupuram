input glyph;
beginglyph;
z0= (x1 + mw/3, 0);
z1= (0, y0 + mw/2);
z2 = ( x1 + mw/2, y1 + m/2); % top
z3 = ( x2 + mw/2, y1);
z4 = ( x3 - mw/3, 0.1m); % bottom middle
z5 = ( x4 - mw/3, y3);
z6 = ( x5 + mw/2, y2); % second top
z7 = ( x6 + mw/2.25, y1);
z8 = ( x7 - tand(-8)*m/3, m/6); %
paths[0] = (z0  ..z1 ..z2{right}.. z3..{left}z4) slanted tand(-8);
paths[0] := paths[0] && (z4{left}.. z5 ..z6{right}..z7..z8) slanted tand(8);
paths[0] := paths[0] shifted(-tand(-8)*m/2,0);

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6, )
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0= (xpart(point 7 of paths[0]), 0);
z1=( x0 + mw - thick/2, 0);
z2= (x1, y1 + m/3);
z3= (x2, y2 + m/2);

paths[2] = z0{dir 20}..{dir 20}z1{dir 20}.. z2.. z3;

clearxy;
z0 = (xpart(point 7 of paths[0]), m/2);
z1 = (x0, 2/3m);
z2 = (x1 + mw/2, m);
z3 = (x2 + mw/3, y1);
z4=  point 0.2 of paths[2];
paths[1] = z0{up}.. z2..z3{dir -100}..{dir 200}z4;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2 )
    nib(thinnib rotated 0 )(2,4)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(0, 4 )
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", (xpart(point 4 of paths[0]),0));
anchor( "right", point 1 of paths[2]);
endglyph;
