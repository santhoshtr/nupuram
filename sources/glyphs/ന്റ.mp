input glyph;
beginglyph;
z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/4, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3, y3 - m/4); % bottom of piller
z5=(x3, y3);
z6=(x5 + mw/2.5, m-thick/2); % Top of second arch
z7=(x6 + mw/2.5, y6 - m/2);
z8=(x7 - mw/4, y7 - m/3);
z9=(x8 - mw/4, y8 + m/3);
z10=(x9 + mw/4, y9 + m/2);
z11=(x10 - mw/4, y10 + 0.3m);

% Ra
z20=(x6, y0 - m/2);
z21=(x20 -  mw/4, y20+ m/2);
z22=(x20 +  m/3, y21 + m/2);
z23=(x22 +  m/3, y22 - m/2);
z24=(x22, y20);

paths[0] = z0..z1..{right}z2.. z3---z4 ;
paths[1] = z5{up}..z6..z7..z8 .. z9..z10{up}..{left}z11;
paths[2] = z20 ..z21..z22..z23 ..z24;
paths[2] := paths[2] xscaled 0.75 yscaled 0.75 shifted (mw/8, -m/3);

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3)
    nib(thinnib rotated 0 )(2,4, 5)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(2)
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
anchor( "vc", (xpart(point 4 of paths[0]),0));
anchor( "bottom", point 4 of paths[2]);
anchor( "right", point 4 of paths[2]);
endglyph;
