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
rbearing := rbearing-thick;
endglyph;
