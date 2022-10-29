% Malayalam digit 10
input glyph;
beginglyph;
z0 = (0, -descent);
z1 = (x0 + mw/4, 0);
z2 = (x1, m/2);
z3=( x2, m); % Top
z4=(x3, y3 - m/2);
z5=(x4 +  mw/3, y4 - m/2);
z6=(x5 +  mw/3, y5+ m/2);
z7=(x6, y6+m/3); % top of pillar
paths[0] = z0{right}..z2..{up}z3{down}..z4{down}..{dir 10}z5.. z6---z7;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3,5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 2 of paths[0])(2)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0=point 5 of paths[0];
z1=(x0 +  mw/3, y0 - m/2); % bottom of second arch
z2=(x1 +  mw/3, y1 + m/2);
z3=(x2 -  mw/3, y2 + m/2);
paths[1] = z0{down}..z1{dir -10}..z2..z3;

pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
anchor( "vc", (xpart(point 3 of paths[0]),0));
anchor( "bottom", point 2.2 of paths[1]);
anchor( "right", point 2.2 of paths[1]);
endglyph;
