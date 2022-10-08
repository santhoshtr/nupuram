input glyph;
beginglyph;

z1=(x3 + mw/2, y3 - m/4);
z2=(x1 - mw/5, 0);
z3=(0, m/2);
z4=(x3 + mw/2, m);
z5=(x4 + mw/2, m/2);
z6=(x5 - mw/4, 0);
z7 = (x3, -descent);

paths[0] = z1{down}..z2{left}..z3.. z4..{down}z5 .. z6 ..{dir 210}z7;
% z0 is z3. But they being equal will confuse the stroking algorithm. Hence add a small delta on X.
z0 = point 2 of paths[0] + (thick*0.15, 0);
paths[0] := z0 .. paths[0];

z12 = z7;
z13 = (x12 + 0.5mw, y12 );
z14 = (x5  + thick/2, y12);
paths[1]:= z12{dir 20}..z13{dir -20}..z14;

pen_stroke(
    nib(thicknib rotated 0 )(0,4)
    nib(thinnib rotated 0 )(1,3,5,6,7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


clearxy;
z0 = (x1 + mw/8, 0.5m);
z1 = (0, 0.75m);
z2 = (x1 + mw/4, m);
z3 = (x2 + mw/4, .66m);
z4 = (x3, .45m);

paths[2] = z0.. z1..z2{dir -8}..{down}z3---z4 ;
paths[2]:= paths[2] shifted(xpart(point infinity of paths[1]) + 2rbearing, 0);
pen_stroke(
    nib(thinnib rotated 0 )(1, 3 )
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

clearxy;
z0 =  point 3 of paths[2] ;
z1 = (x0 + mw/3, m);
z2 = (x1 + mw/4, m/2);
z3 = (x2 - 0.6mw, 0);

paths[3] = z0{dir 80}..z1{dir -10}..z2.. z3;

pen_stroke(
    nib(thicknib rotated 0 )(1)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

endglyph;
