input glyph;
beginglyph;
z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y1);
z4=(x3 + mw/2, m);
z5=(x4 + mw/3, m/2);
z6=(x3, -descent);
paths[0] = z0..z1{down}..{right}z2{right}..z3..{dir -10}z4..{dir -100}z5.. z6;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1,3, 5,7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])( strokes[0]);

% tail
z12 = (xpart (point 3 of paths[0]), -descent );
z13 = (x12 + 0.6mw, y12 );
z14 = (xpart (point 5 of paths[0]) + thick/2, y13);
paths[1]:= z12{dir 20}..z13..{dir 20}z14;
pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
rbearing:=rbearing - thick;

anchor( "vc", point 3.5 of paths[0]);
anchor( "bottom", (xpart(point 5 of paths[0]), 0));
endglyph;
