input glyph;
beginglyph;
z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y2 + 0.5m);
z4=(x3 + mw/3, y3 + 0.4m);
z5=(x4 + mw/2, y4 - 0.6m);
z6=(x5 - mw/4, 0.05m);
z7=(x6 - mw/4, y6 + 0.3m);
z8=(x7 + mw/3  + thick/2, y7 + 0.4m);

paths[0] = z0..z1{down} ..{right}z2{right} ..z3..z4..z5  ..z6..z7..{right}z8 ;
paths[0] := paths[0] shifted(0, 0.05m) yscaled 0.95;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6, 8 )
    nib(thinnib rotated 0 )(1,3,5,7, 9)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3,  y3 -m/4); % bottom of piller
paths[1] = z0..z1.. z2.. {down}z3---z4 ;


clearxy;
z0=point 3 of paths[1];
z1=(x0 + mw/2, m); % Top of second arch
z2=(x1 + mw/3, y1 - m/2);
z3= ( x2 - mw/3, y2 - m/2);

paths[2] = z0{up}..z1..z2..z3;
paths[2]:= paths[2] slanted tand(8) shifted (-tand(8)*mw/3, 0);

paths[1] := paths[1] shifted(0.4m, -0.85m) xscaled 0.75 yscaled 0.75;
paths[2] := paths[2] shifted(0.4m, -0.85m)  xscaled 0.75 yscaled 0.75;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(2, 4, 6)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", point 4 of paths[0]);
anchor( "right", point 5.8 of paths[0]);
endglyph;
