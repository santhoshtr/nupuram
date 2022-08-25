input glyph;
beginglyph;
z0=(x1+mw/3, 0);
z1=(0, y0 + mw/2);
z2 = ( x1 + mw/2.5, y1 + m/2); % top
z3 = ( x2 + mw/2, y2 - m/2);
z4 = ( x3 - mw/4, y3 - m/3); % bottom middle
z5 = ( x4 - mw/4, y4+ m/3);
z6 = ( x5 + mw/2, y2); % second top
z7 = ( x6 + mw/2.5, y1);
z8 = ( x7 - mw/2, y0 - m/6);
z9 = ( x5,  -descent );

paths[0] = z0  ..z1..z2{right}.. z3..z4..z5 ..z6{right}..z7..z8..{dir 200}z9;

% tail
z12 = (xpart (point 5 of paths[0]), -descent );
z13 = (x12 + 0.6mw, y12 );
z14 = (xpart (point 7 of paths[0]) + thick/2, y13);

paths[1]:= z12{dir 20}..z13..{dir 20}z14;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6, )
    nib(thinnib rotated 0 )(1, 3, 5, 7, 8)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
rbearing:=rbearing - thick;
endglyph;
