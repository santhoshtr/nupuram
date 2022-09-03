input glyph;
beginglyph;
z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y1);
z4=(x3 + mw/2, m);
z5=(x4 + mw/3, 2/3m);
z6=(x3, 0);
paths[0] = z0..z1{down}..{right}z2{right}..z3..{dir -10}z4..z5..{dir 200}z6;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1,3, 5,7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])( strokes[0]);

clearxy;
z0= point infinity of paths[0];
z1=( x0 + mw - thick/2, 0);
z2= (x1, y1 + m/3);
z3= (x2, y2 + m/2);

paths[1] = z0{dir 20}..{dir 20}z1{dir 20}.. z2.. z3;
pen_stroke(
    nib(thicknib rotated 0 )(0, 4 )
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", point 3.5 of paths[0]);
anchor( "bottom", point 1 of paths[1]);
anchor( "right", point 1 of paths[1]);
endglyph;
