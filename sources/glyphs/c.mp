input glyph;
beginglyph;

z0 = (.75 * sw - thick/2 , s - s/(2*phi) + thick/4 );
z1 = (x0 - .75*sw*.5 , s - thick/4);
z2 = (x1 - .75*sw*0.4 , s/2 );
z3 = (x2 + .75*sw*0.4, thick/4);
z4 = (x3 + .75*sw*0.5 + thick/4,  s/3);

% bar
z5 = (x2, y1 - s/phi + thick/4);
paths[0] =  z0{dir 90} ..z1.. z2 ..z3..{dir 80}z4;

pen_stroke(
    nib(thicknib rotated 0 )(1,3)
    nib(thinnib rotated 0 )(2,4)
    nib(thinterminalnib rotated 0 )(0 )
    nib(thinterminalnib rotated 135 )(infinity )
)(paths[0])(strokes[0]);


endglyph;
