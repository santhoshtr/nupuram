input glyph;
beginglyph;

% Left slant
z0=(0, 0);
z1=(x0 + 0.1Xw, y0 + .5X - thick/2);
z2=(x1 + 0.2Xw, X - thick/4);

% Right slant
z3=z2;
z4=(x3 + 0.2Xw, y1);
z5=(x4 + 0.1Xw, y0);
paths[0] = z0{up}..z1..z2..z3..z4..{down}z5;
% bar
z6 = point 0.8 of paths[0] ;
z7 = point 4.2 of paths[0] ;

paths[1]:= z6 ..z7 ;
pen_stroke(
    nib(thinnib rotated 0 )(1,4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


endglyph;
