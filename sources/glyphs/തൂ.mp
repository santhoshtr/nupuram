input glyph;
beginglyph;
z0= (x1 + mw/3, 0);
z1= (0, y0 + mw/2);
z2 = ( x1 + mw/2, y1 + m/2); % top
z3 = ( x2 + mw/2, y1);
z4 = ( x3 - mw/3, 0.1m); % bottom middle
z5 = ( x4 - mw/3, y3);
z6 = ( x5 + mw/2, y2); % second top
z7 = ( x6 + 0.4mw, y6-m/4);
z8 = ( x7 - mw/5, y7-m/4);
z9 = ( x8 + mw/3, y8-m/4);
z10 = ( x9 - mw/6, y9-m/3);

paths[0] = (z0  ..z1 ..z2{right}.. z3..{left}z4) slanted tand(-8);
paths[0] := paths[0] && (z4{left}.. z5 ..z6{right}..z7..{left}z8{right}..z9..z10) slanted tand(8);
paths[0] := paths[0] shifted(-tand(-8)*m/2,0);

paths[0]:= paths[0] .. ( xpart (point 5 of paths[0]),  -descent);;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6, )
    nib(thinnib rotated 0 )(1, 3, 5, 7, 9,10)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 8 of paths[0])(8)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

% tail
clearxy;
z0 = point infinity of paths[0];
z1 = ((x0 + x2)/2, y0 );
z2 = (xpart (point 7 of paths[0]) + thick/2, y0);

paths[1]:= z0{dir 20}..z1..{dir 20}z2;

pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
rbearing:=rbearing - thick;
endglyph;
