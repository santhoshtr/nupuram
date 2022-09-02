input glyph;
beginglyph;
z0=(x1+mw/3, 0);
z1=(0, y0 + mw/2);
z2 = ( x1 + mw/2.5, y1 + m/2); % top
z3 = ( x2 + mw/2, y2 - m/2);
z4 = ( x3 - mw/4, y3 - m/3); % bottom middle
z5 = ( x4 - mw/4, y4+ m/3);
z6 = ( x5 + mw/2, m); % second top
z7 = ( x6 + mw/2.25, y6 - m/4);
z8 = ( x7 - mw/3, m/2);
z9 = ( x8 + mw/2.25, y8 - m/4 );
z10 = ( x5,  -descent );

paths[0] = z0  ..z1..z2{right}.. z3..z4..z5 ..z6 ..z7..{left}z8{right}..z9{down}..{dir 195}z10;

% tail
clearxy;
z0 = (xpart (point infinity of paths[0]), -descent );
z1 = ((x0 + x2)/2, y0 );
z2 = (xpart (point 7 of paths[0]) + thick/2, y0);

paths[1]:= z0{dir 20}..z1..{dir 20}z2;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6, )
    nib(thinnib rotated 0 )(1, 3, 5, 7, 9)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 8 of paths[0])(8)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
rbearing:=rbearing - thick;
endglyph;
