input glyph;
beginglyph;
z0=(x1+mw/3 , 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, y1 + m/2);
z3=(x2 + mw/3, y2 - m/2);
z4=(x3, y3 - m/3); % bottom of piller

paths[0] = z0..z1.. z2.. z3---z4 ;
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

pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(2, 4)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);



clearxy;
z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3,  y3 -m/4); % bottom of piller
paths[2] = z0..z1.. z2.. {down}z3---z4 ;


clearxy;
z0=point 3 of paths[2];
z1=(x0 + mw/2, m*0.9); % Top of second arch
z2=(x1 + mw/3,  m/2);
z3= ( x2 - mw/3, 0);

paths[3] = z0{up}..z1..z2..z3;
paths[3]:= paths[3] slanted tand(8) shifted (-tand(8)*mw/3, 0);

paths[2] := paths[2] shifted(m, -0.9m) xscaled 0.75 yscaled 0.75;
paths[3] := paths[3] shifted(m, -0.9m)  xscaled 0.75 yscaled 0.75;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(2, 4, 6)
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);



anchor( "vc", (x3,0));
anchor( "bottom", point 3.3 of paths[1]);
anchor( "right", point 3.3 of paths[1]);

endglyph;
