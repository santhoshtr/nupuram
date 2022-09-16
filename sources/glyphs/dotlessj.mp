input glyph;
beginglyph;
r := 0.8;
z0= (x1 , s);
z1=( x2 - thick/4, y0 - 0.5s);
z2=( x3 + r*sw/3, 0);
z3=( x4 + r*sw/3, -descent);
z4=( 0, -descent/3);

paths[0] = z0{dir -110}..  z1..  z2..z3{left}.. z4;

pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
lbearing:=0;
endglyph;
