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

clearxy;
z0 = (x1 + mw/8, 0.5m);
z1 = (0, 0.75m);
z2 = (x1 + mw/4, m);
z3 = (x2 + mw/4, .66m);
z4 = (x3, .45m);

paths[3] = z0.. z1..z2{dir -8}..{down}z3---z4 ;
paths[3]:= paths[3] shifted(xpart(point infinity of paths[2]) + 2rbearing, 0);
pen_stroke(
    nib(thinnib rotated 0 )(1, 3 )
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

clearxy;
z0 =  point 3 of paths[3] ;
z1 = (x0 + mw/3, m);
z2 = (x1 + mw/4, m/2);
z3 = (x2 - 0.6mw, 0);

paths[4] = z0{dir 80}..z1{dir -10}..z2.. z3;

pen_stroke(
    nib(thicknib rotated 0 )(1)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[4])(0)
    nib(terminalnib rotated terminalangle infinity of paths[4])(infinity)
)(paths[4])(strokes[4]);

endglyph;
