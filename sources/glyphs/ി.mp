input glyph;
beginglyph;

z0=(0, m + m/3);
z1=(x0 + 0.66mw, y0 - m/4);
z2=(x1, y1 - m/2);
z3=(x2 - thick/2, -thick/2);

paths[0] =  z0{dir 20} .. z1.. z2{dir 260}..{dir -80}z3;
paths[0] := paths[0] shifted (-x1+thick/2, 0);

pen_stroke(
    nib(thinnib rotated 0 )(1, 2,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
% lbearing:=m;
endglyph;
