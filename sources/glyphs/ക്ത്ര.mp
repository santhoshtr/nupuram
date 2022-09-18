input glyph;
beginglyph;

z0=(mw/2, 0.6m);
z1=(x0 + mw/3, y0 + 0.4m);
z2=(x1 + mw/3, y1 - m/2);
z3=(x2 - mw/3, y2 - m/2);
z4=(x3 - mw/3, y3 + 0.4m);
z5=(x4 - mw/4, y4 - 0.4m);
z6=(x5 - mw/4, y5 + 0.2m);
z7=(x6 + mw/4, y6 + 0.3m);
z8=(x2 + mw/4, y7);
z9=(x8 + mw/4, y8 - 0.3m);
z10=(x9 - mw/3, y9 - 0.2m);

paths[0] := z0{up}..{right}z1..{down}z2..z3{left}..{up}z4{down}..z5..z6..z7{dir 18} .. z8{dir -18}..z9..z10 ;
paths[0]:=subpath(0, 8) of paths[0];
paths[0] :=paths[0] shifted (mw/3, 0);

pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0,2, 4, 6, 9)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle 4 of paths[0])(4)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0= (x1+ mw/3, 0) ;
z1=  point infinity of paths[0];
z2 = ( x1 + mw/2, y1 + m/2); % top
z3 = ( x2 + mw/2, y2 - m/2);
z4 = ( x3 - mw/3, y3 - m/2 + thick/2); % bottom middle
z5 = ( x4 - mw/3, y4 + m/2 - thick/2);
z6 = ( x5 + mw/2, y2); % second top
z7 = ( x6 + mw/2, y1);
z8 = ( x7 - mw/3, y0); %
paths[1] = (z0  ..z1 ..z2{right}.. z3..{left}z4) slanted tand(-8);
paths[1] := paths[1] && (z4{left}.. z5 ..z6{right}..z7..z8) slanted tand(8);
paths[1] := paths[1] shifted(-tand(-8)*m/2,0);
paths[1]:=subpath(0, 7) of paths[1];
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6, )
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


clearxy;
z0 = point 7 of paths[1];
z1 = (xpart(point 4 of paths[1]), -descent*1.2);
z2 = (xpart(point 4 of paths[0]), y1);
z3 = (xpart(point 6 of paths[0]) - mw/3, ypart(point 6 of paths[0]));
z4 = (x3 + mw/4, m);

paths[2] = z0{down} ..{dir 190}z1 ..{dir 170}z2..z3..z4;
pen_stroke(
    nib(thinnib rotated 0 )(3)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", z1);
anchor( "right", point 0.5 of paths[2]);

endglyph;
