input glyph;
beginglyph;
z0=(x1+mw/3 , 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, y1 + m/2);
z3=(x2 + mw/3, y2 - m/2);
z4=(x3, y3 - m/3); % bottom of piller

paths[0] = z0..z1.. z2.. z3---z4 ;

z5=(x3, y3);
z6=(x5 + mw/4, 0.88m);
z7=(x6 + mw/4, 0.4m);
z8=(x7 + mw/4, 0);

paths[1] =  z5{up}..z6 ..z7{dir -102}..z8;
paths[1] := paths[1] slanted tand(12) shifted (-tand(12)*mw/2, 0);
z9= (x8 + mw/3, y8 + m/2);
z10=(x9 - mw/3, y9 + m/2);
paths[1] := paths[1]..z9 .. z10;
pen_stroke(
    nib(thicknib)(0, 2)
    nib(thinnib)(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(4)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib)(1, 3, 5, 7)
    nib(thinnib)(2, 4)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


% Ra
clearxy;
z0=(0, 0);
z1=(x0- mw/4, m/2);
z2=(x0 + mw/3, y1 + m/2);
z3=(x2 + mw/3, y2-m/2);
z4=(x2, 0);
paths[2] = z0{dir 135} ..z1..{right}z2..z3{dir 260} ..z4;
paths[2] := paths[2] shifted (mw/3, -1.1m ) xscaled 0.75 yscaled 0.7;
paths[3] := paths[2] shifted (mw, 0);

pen_stroke(
    nib(thicknib)(0, 2,5, 6)
    nib(thinnib)(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

pen_stroke(
    nib(thicknib)(0, 2,5, 6)
    nib(thinnib)(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);
anchor("vc", z3);
anchor("right", (point 4 of paths[3]));
endglyph;
