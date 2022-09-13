input glyph;
beginglyph;
z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y1);
z4=(x3 + mw/3, m);
z5=(x4 + mw/3, 0.4m);
z6=(x5, y5-m/4);
paths[0] = z0..z1{down}..{right}z2{right}..z3..{dir -10}z4..z5---z6;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1,3, 5,7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])( strokes[0]);

clearxy;
z0=point 5 of paths[0];
z1=(x0 + mw/2, y0 + .6m); % Top of second arch
z2=(x1 + mw/3, y1 - m/2);
z3= ( x2 - mw/3, y2 - m/2);
z4= ( x3 - mw/4, y3 + .3m);
z5= ( x2 - thick*0.13, y2);

paths[1] = z0{up}..z1..z2..z3..z4.. z5;
paths[1]:= paths[1] slanted tand(8) shifted (-tand(8)*mw*0.4, 0);

pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5)
    nib(thinnib rotated 0 )(0, 2, 4, 6)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
anchor( "vc", point 3.5 of paths[0]);
anchor( "right", point 1 of paths[1]);
endglyph;
