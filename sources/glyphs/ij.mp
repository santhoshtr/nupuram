input glyph;
beginglyph;
z0= (0.05sw, s);
z1=(0,  s/2);
z2=(x0 + 0.05sw, 0);

paths[0] = z0..z1{down}..{dir -60}z2;
paths[1] := fullcircle scaled (thick*1.5) shifted(x0, 1.33s);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
strokes[1] = paths[1];

% j

clearxy;
r := 0.8;
z0= (x1 , s);
z1=( x2 - thick/4, y0 - 0.5s);
z2=( x3 + r*sw/3, 0);
z3=( x4 + r*sw/3, -descent);
z4=( 0, -descent/3);

paths[2] = z0{dir -110}..  z1..  z2..z3{left}.. z4;

pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

paths[3] := paths[1] shifted(x0, 0);
strokes[3] = paths[3];
endglyph;
