input glyph;
beginglyph;
save r;
r=0.8;
z0=(0.9*sw*r, 0.8s);
z1=(0.4sw*r,s-thick/4);
z2=(0, s/3);
z3=( 0.4*sw*r, thick/4 );
z4= (sw*r, s/4);

paths[0] = z0{dir 120}..z1{dir 195}.. z2{dir -75}..z3 ..{dir 60}z4;

pen_stroke(
    nib(thicknib rotated 0 )(1,3)
    nib(thinnib rotated 0 )(2,4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
clearxy;
z0=(xpart(point 0.8 of paths[0]), s*1.3);
z1=(x0, ypart(point 0.8 of paths[0]));
paths[1] =z0--z1;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
clearxy;
z0=(xpart(point 3.2 of paths[0]), -s*0.3);
z1=(x0, ypart(point 3.2 of paths[0]));
paths[2] =z0--z1;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
