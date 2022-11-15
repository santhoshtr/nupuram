input glyph;
beginglyph;

clearxy;

r = 0.75;
z0 = (0, 0.2s);
z1 = (x0 + sw*r, .25s);
z2 = ((x0 + x1)/2, y1 + .25s);
z3=  (x0 + thick/4, y2 + .25s);
z4=  (x1 - thick/4, 0.85s);

paths[1] = z0{dir -40}  ..z1.. z2 ..z3..{dir -40}z4 ;
paths[1]:=subpath(0,3.6) of paths[1] shifted(s/3, 0) xscaled 0.9 yscaled 0.9;
pen_stroke(
    nib(thinnib)(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
clearxy;
z0=(0,0);
z1=(0,X/2);
z2=(0,X*0.75);
z3=point infinity of paths[1];
paths[0]=z0..z1..z2..{down}z3;
pen_stroke(
    nib(thinnib)(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
endglyph;
