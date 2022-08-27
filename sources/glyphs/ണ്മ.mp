input glyph;
beginglyph;

paths[0] :=left_arch_with_eye;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6)
    nib(thinnib rotated 0 )(1,3, 5 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

% Second arch
z11 = point 5 of paths[0];
z12 = (x11 + mw/4, y11 + m/2.5);
z13 = (x12 + mw/4, y12 - m/3);
z14 = (x13, m/6);
paths[1] = z11{up}..z12..z13---z14;


pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

clearxy;

z1 = point 2.5 of paths[1];
z2 = (x1 + mw/2, m);
z3 = (x2 + mw/3, 0.66m);
z4=  (x1 + mw/8, 0);
paths[2] = z1{up}..z2..z3{dir -100}..{dir 210}z4;


z5= (xpart(point infinity of paths[2]), 0);
z6=( xpart(point 2 of paths[2])  + thick/2, 0);
z7= (x6, y6 + m/3);
z8= (x7, y7 + m/2);

paths[3] = z5{dir 20}..{dir 20}z6{dir 20}.. z7.. z8;

pen_stroke(
    nib(thicknib rotated 0 )(3 )
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thicknib rotated 0 )(0, 4 )
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);
anchor( "bottom", point 1 of paths[3]);
anchor( "right", point 1 of paths[3]);
endglyph;
