input glyph;
beginglyph;
z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y1);
z4=(x3 + mw/2, m); % top
z5=(x4 + mw/3, y4 -m/4);
z6=(x5 - mw/4, y5 -m/4); % <
z7=(x6 + mw/3, y6-m/4);
z8=(x7 - mw/4, y7-m/3);
z9=(x3, -descent);
paths[0] = z0..z1{down}..{right}z2{right}..z3..{dir -10}z4.. z5.. {left}z6{right}..z7..z8..{dir 200}z9;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1,3, 5,7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])( strokes[0]);

% tail
clearxy;
z0 = (xpart (point infinity of paths[0]), -descent );
z1 = (x0 + 0.6mw, y0 );
z2 = (xpart (point 7 of paths[0]) + thick/2, y0);
paths[1]:= z0{dir 20}..z1..{dir 20}z2;
pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
rbearing:=rbearing - thick;

anchor( "vc", point 3.5 of paths[0]);
anchor( "bottom", (xpart(point 5 of paths[0]), 0));
endglyph;
