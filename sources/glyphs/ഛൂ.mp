input glyph;
beginglyph;

z0=(x1 + 0.1mw, 0.3m);
z1=(0, y0 + m/4);
z2=(x1 + mw/4, y1 + m/4);
z3=(x2 + mw/4, y2 - m/4);
z4=(x0, thick/5);

paths[0] = z0{dir 130}..z1..{right}z2..z3 .. {dir 200}z4;
paths[0] := paths[0] slanted tand(8);
paths[0] := paths[0] shifted (mw/8, 0);

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

z5=(0, 0);
z6=(x5 + mw*1.2, y5);

z10=(x11 - 0.3mw, 0);
z11=(x6 - mw/4, y10 + 0.5m);
z12=(x11 + 0.5mw, y11 + 0.5m);
z13=(x12 + 0.5mw, y12 - 0.5m);
z14=(x13 - 0.3mw, y13 - 0.5m);
z15=(x14 - mw/4, y14 + m/3);
z16=(x15 + mw/2, y15 + m/3);
z17=(x16 + mw/2, y16 - m/4);
z18=(x17 - mw/4, y17 - m/6);
z19=(x18 + mw/3, y18 - m/6);
z20=(x15, -descent*1.2);

paths[1] :=z5{dir 20}..{dir 20}z6{dir 135}..z11..z12..z13..z14..{dir 80}z15..z16..z17..{left}z18{right}..z19{dir -80}..{dir 190}z20;

pen_stroke(
    nib(thinnib rotated 0 )(2, 4, 6, 8, 10)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle 9 of paths[1])(9)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

clearxy;
z0 = point infinity of paths[1] ;
z1 = ((x0+ x2)/2, y0);
z2 = (xpart(point 8 of paths[1])+ thick/2, y0);
paths[2] :=  z0{dir 20}..z1..{dir 20}z2;
pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
rbearing:=rbearing - mw/10;
anchor( "vc", point 3 of paths[0]);

endglyph;
