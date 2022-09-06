input glyph;
beginglyph;
z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y1);
z4=(x3 + mw/2, m);
z5=(x4 + mw/3, y4-m/4);
z6=(x5 - mw/3, y5-m/4);
z7=(x6 + mw/2.5, y6-m/4);
z8=(x7 - mw/2, y7-m/4);
paths[0] = z0..z1{down}..{right}z2{right}..z3..{right}z4..z5..{left}z6{right}..z7..{dir 160}z8;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1,3, 5,7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 6 of paths[0])(6)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])( strokes[0]);


clearxy;
z0=point 7.9 of paths[0];
z1=(x0 + 0.8mw, mw/2);
paths[1] = z0{dir -20}..{up}z1;
pen_stroke(
     nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
clearxy;
z0=(xpart(point infinity of paths[1]), m-m/6); % top of piller
z1=(x0, m/2);
z2=(x1 +  mw/3, y1 - m/2); % Top of second arch
z3=(x2 +  mw/3, y2 + m/2);
z4=(x3 -  mw/3, y3 + m/2);

paths[2] = z0---z1..z2{dir -10}..z3{dir 100}..z4;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", point 5 of paths[0]);
anchor( "bottom", point 2.3 of paths[2]);
anchor( "right", point 2.3 of paths[2]);
endglyph;
