input glyph;
beginglyph;
paths[0] = left_arch_with_eye;

z8 = point 5 of paths[0];
z9 = (x8 + mw/3, m);
z10 = (x9 + mw/3, y9 - 0.5m);
z11 = (x10 - mw/2, y10 - 0.5m);
z12 = (xpart(point 4 of paths[0]), -descent);
paths[1]:= z8{up}..z9{right}.. z10{dir -90} ..{dir 200}z11..{dir 210}z12;
paths[1]:= paths[1] slanted tand(8);
paths[1]:= paths[1] shifted (-tand(8)*m/2,0);

z13 = (x12 + 0.6mw, y12);
z14 = (xpart(point 2 of paths[1]) + thick/2, y12);
paths[2]:= (point 4 of paths[1]){dir 20}..z13..{dir 20}z14;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6)
    nib(thinnib rotated 0 )(1,3, 5 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thicknib rotated 0 )(1, 3)
    nib(thinnib rotated 0 )(0,2,4 )
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
rbearing := rbearing-thick;
endglyph;
