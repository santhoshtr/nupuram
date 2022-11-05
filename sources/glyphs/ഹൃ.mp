input glyph;
beginglyph;
paths[0] = pa_mouth;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

z5=point infinity of paths[0];
z6=(x5 + 0.75mw, y5);

paths[1] := z5{dir 20}..{dir 20}z6 && subpath(0, 2.9) of ra shifted (xpart(z6) - mw/4, -thick/4);

pen_stroke(
    nib(thinnib rotated 0 )(2,4,6)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated (terminalangle infinity of paths[1]))(infinity)
)(paths[1])(strokes[1]);

clearxy;
% ഋ sign
z0 = point 4 of paths[1];
z1 = ( xpart(point 1 of paths[1]), -descent*1.5);
z2 = (x1 - mw/3, -descent);
z3 = (x2 + mw*0.7 , y2);
paths[2] = z0{dir -95}..z1{left}..z2{dir 90}..{dir -30}z3;
pen_stroke(
    nib(thinnib rotated 0 )(2, 4)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);


anchor( "vc", point 0.5 of paths[1]);
anchor( "bottom", point infinity of paths[1]);
anchor( "right", point infinity of paths[1]);
endglyph;
