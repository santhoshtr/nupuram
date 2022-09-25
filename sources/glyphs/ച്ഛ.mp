input glyph;
beginglyph;

clearxy;
z0=(0, 0);
z1=(x0 + 1.1mw, y0);
z2=(x1, y1 + m/2);
z3=(x2, y2 + m/2);
paths[1] := z0{dir 20}..{dir 20}z1{dir 20}..z2...{dir 60}z3;

clearxy;
z0=(x1 + mw/10, m/3);
z1=(xpart(point 0.1 of paths[1]), y0 + m/4);
z2=(x1 + mw/3, 0.85m);
z3=(x0 + mw/2, y0 + m/6);
z4=point 0 of paths[1];

paths[0] = z0{dir 135}..z1..{dir -10}z2..z3 .. {dir 200}z4;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

clearxy;

z0=(x1 + 0.1mw, 0.3m);
z1=(0, y0 + m/4);
z2=(x1 + mw/4, y1 + m/4);
z3=(x2 + mw/4, y2 - m/4);
z4=(x0, thick/5);

paths[2] = z0{dir 130}..z1..{right}z2..z3 .. {dir 200}z4;
paths[2] := paths[2] slanted tand(8);
paths[2] := paths[2] shifted (mw/8, 0);
paths[2] := paths[2] xscaled 0.8 yscaled 0.7 shifted (-0.1m, -0.7m);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

z5=(0, 0);
z6=(x5 + mw*1.2, y5);

z10=(x11 - 0.3mw, 0);
z11=(x6 - mw/4, y10 + 0.5m);
z12=(x11 + 0.5mw, y11 + 0.5m);
z13=(x12 + 0.5mw, y12 - 0.5m);
z14=(x13 - 0.3mw, y13 - 0.5m);
z15=(x14 - mw/4, y14 + m/3);
paths[3] :=z5{dir 20}..{dir 20}z6{dir 135}..z11..z12..z13..z14..{dir 80}z15;
z16 = point 3.75 of paths[3];
paths[3] := (paths[3]..{right}z16 );
paths[3] := paths[3] xscaled 0.8 yscaled 0.7 shifted (-0.1m, -0.7m);
pen_stroke(
    nib(thinnib rotated 0 )(2, 4, 6)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor( "vc", point 2 of paths[0]);
anchor( "bottom", point 1 of paths[1]);
anchor( "right", point 1 of paths[1]);
rbearing:=rbearing - mw/6;
endglyph;
