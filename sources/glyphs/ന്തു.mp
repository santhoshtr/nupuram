input glyph;
beginglyph;

z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3, y3 - m/4); % bottom of piller

paths[0] = z0..z1.. z2.. z3---z4 ;

pen_stroke(
    nib(thicknib)(0, 2)
    nib(thinnib)(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


clearxy;
z0 = point 3 of paths[0];
z1 = (x0 + mw/2.4, m-thick/2); % top
z2 = (x1 + mw/3, y1 - m/2);
z3 = (x2 - mw/4, thick/2); % bottom middle
z4 = (x3 - mw/4, y3 + m/2.5);
z5 = (x4 + mw/2, m); % second top
z6= (x5 + mw/2.5, m/3);
z7 = (x4, -descent);

paths[1] =z0{up}..z1{dir 10}.. z2..z3..z4 ..z5{dir 10}..z6..{dir 200}z7;

pen_stroke(
    nib(thinnib)(2, 4, 6, 8)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

% tail
clearxy;
z0 = (xpart (point infinity of paths[1]), -descent);
z1 = ((x0 + x2)/2, y0);
z2 = (xpart (point 6 of paths[1]) + thick/2, y0);

paths[2]:= z0{dir 20}..z1..{dir 20}z2;
pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor("vc", point 0 of paths[1]);
anchor("bottom", point 6 of paths[1]);
anchor("right", point 6 of paths[1]);
rbearing:=rbearing - thick;
endglyph;
