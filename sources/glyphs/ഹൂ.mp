input glyph;
beginglyph;

paths[0] = pa_mouth;

pen_stroke(
    nib(thicknib)(0, 2, 4, 5, 6)
    nib(thinnib)(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0=point infinity of paths[0];
z1=(x0 + 0.75mw, y0);

paths[1] := z0{dir 20}..{dir 20}z1 && ra shifted (xpart(z1) - mw/4, -thick/4);
clearxy;
z0 = (xpart(point 3 of paths[1]) + mw/3, m-m/4);
z1 = (x0 - mw/4, y0-m/3);
z2 = (x1 + mw/3, y1-m/4);
z3 = (xpart(point 2.5 of paths[1]), -descent);
paths[1] := subpath(0, 3) of paths[1] .. z0..{left}z1{right}..z2..{dir 190}z3;

pen_stroke(
    nib(thinnib)(2,4,6)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle 5 of paths[1])(5)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

% tail
clearxy;
z0 = point infinity of paths[1];
z1 = ((x0 + x2)/2, y0);
z2 = (xpart (point 4 of paths[1]) + thick/2, y1);
paths[2] = z0{dir 20}..z1..{dir 20}z2;
pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

rbearing:=rbearing - thick;

anchor("vc", point 0.5 of paths[1]);

endglyph;
