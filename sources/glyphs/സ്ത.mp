input glyph;
beginglyph;
z0=(x1+mw/3 , 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, y1 + m/2);
z3=(x2 + mw/3, y2 - m/2);
z4=(x3, y3 - m/3); % bottom of piller

paths[0] = z0..z1.. z2.. z3---z4 ;
paths[0] := paths[0] shifted(0, 0.1m) yscaled 0.9;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(4 )
)(paths[0])(strokes[0]);

clearxy;
z0=point 3 of paths[0];
z1=(x0 + mw/4, 0.88m);
z2=(x1 + mw/4, 0.4m);
z3=(x2 + mw/4, 0);

paths[1] =  z0{up}..z1 ..z2{dir -102}..z3;
paths[1] := paths[1] slanted tand(12) shifted (-tand(12)*mw/2, 0);
z4= (x3 + mw/3, y3 + m/2);
z5= (x4 - mw/3, y4 + m/2);
paths[1] := paths[1]..z4 .. z5;
paths[1] := paths[1] shifted(0, 0.1m) yscaled 0.9;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(2, 4)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

clearxy;
z0= (x1 + mw/3, 0);
z1= (0, y0 + mw/2);
z2 = ( x1 + mw/2, y1 + m/2); % top
z3 = ( x2 + mw/2, y2 - m/2);
z4 = ( x3 - mw/3, y3 - m/2 + thick/2); % bottom middle
z5 = ( x4 - mw/3, y4 + m/2 - thick/2);
z6 = ( x5 + mw/2, y2); % second top
z7 = ( x6 + mw/2, y1);
z8 = ( x7 - mw/3, y0); %
paths[2] = (z0  ..z1 ..z2{right}.. z3..{left}z4) slanted tand(-8);
paths[2] := paths[2] && (z4{left}.. z5 ..z6{right}..z7..z8) slanted tand(8);
paths[2] := paths[2] shifted(m*0.75,-0.9m) xscaled 0.8 yscaled 0.7;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6, )
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", (x3,0));
anchor( "bottom", point 3.3 of paths[1]);
anchor( "right", point 3.3 of paths[1]);

endglyph;
