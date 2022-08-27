input glyph;
beginglyph;
z0 = (mw/4, m/4);
z1 = (0, 2/3m);
z2 = (mw/2, m);
z3 = (x2 + mw/3, y1);
z4=  (x1 + mw/8, 0);
paths[0] = z0..z1..z2..z3{dir -100}..{dir 210}z4;

z5=(x4, 0);
z6=(x3 + mw/6, y5);
paths[1] = z5{dir 20}..{dir 20}z6 ;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5 )
    nib(thinnib rotated 0 )(1,3,6)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(0, 4, 5 )
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

paths[2] := paths[0] shifted (.9mw,0);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5 )
    nib(thinnib rotated 0 )(1,3,6)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

z9=(x6 - thick/2, 0);
z7= (x9, y9 + m/3);
z8= (x7, y7 + m/2);

paths[3] = z5{dir 10}.. z9{dir 20}..z7..z8;
paths[3]:= paths[3] shifted (0.9mw,0);

pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor( "vc", (xpart(point 3 of paths[0]),0));
anchor( "bottom", point 0.9 of paths[3]);
anchor( "right", point 0.9 of paths[3]);
endglyph;
