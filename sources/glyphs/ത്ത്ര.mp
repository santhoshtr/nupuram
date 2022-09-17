input glyph;
beginglyph;
z0 = ( x1+mw/3, 0);
z1 = ( 0, y0 + m/2);
z2 = ( x1 + mw/2.5, y1 + m/2); % top
z3 = ( x2 + mw/2, y2 - m/2);
z4 = ( x3 - mw/4, m/10); % bottom middle
z5 = ( x4 - mw/4, y4 +  m/3);
z6 = ( x5 + mw/2, 0.9m); % second top
z7 = ( x6 + mw/3,  y6 - m/2);
z8 = ( x7,  m/6); %
paths[0] = z0  ..z1..z2 .. z3..z4..z5 ..z6 .. z7 --- z8;
paths[0]:= paths[0] shifted(mw/3, 0);
paths[1] =  reverse( paths[0] reflectedabout((.5,-1),(.5,+1)) shifted (xpart(point 7 of paths[0]) *2,0) );
paths[1] := subpath(0,7) of paths[1];
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6  )
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6  )
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

clearxy;
z0 = point7 of paths[1];
z1 = (xpart(point 4 of paths[1]), -descent - thick/2  );
z2 = (xpart(point 2.25 of paths[0]), -descent - thick/2);
z3 = (xpart(point 1 of paths[0]) - mw/3, ypart(point 1 of paths[0]));
z4 = (x3 + mw/10, m);
paths[3] =  z0{dir -90} .. {dir 190}z1  ..z2{dir 170}   ..z3..z4;

pen_stroke(
    nib(thinnib rotated 0 )(3)
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor( "right", point 0.75 of paths[3]);
endglyph;
