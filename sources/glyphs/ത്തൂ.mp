input glyph;
beginglyph;
z0=(x1+mw/3, 0);
z1=(0, y0 + mw/2);
z2 = ( x1 + mw/2.5, y1 + m/2); % top
z3 = ( x2 + mw/2, y2 - m/2);
z4 = ( x3 - mw/4, m/10); % bottom middle
z5 = ( x4 - mw/4, y4 +  m/3);
z6 = ( x5 + mw/2, 0.9m); % second top
z7 = ( x6 + mw/3,  y6 - m/2);
z8 = ( x7,  m/6); %
paths[0] = z0  ..z1..z2 .. z3..z4..z5 ..z6 .. z7 --- z8;
paths[1] =  reverse( paths[0] reflectedabout((.5,-1),(.5,+1)) shifted (xpart(point 7 of paths[0]) *2,0) );

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6  )
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0 = (xpart(point 6 of paths[1]) + mw/2.7, ypart(point 6 of paths[1]) - m/4) ;
z1= ( x0 - mw/4, y0-m/4);
z2= ( x1 + mw/3, y1-m/4);
z3 = (xpart(point 5 of paths[1]), -descent );
paths[1] := (subpath(0, 6) of paths[1])  ..  z0..{left}z1{right}..z2..{dir 195}z3;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6  )
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle 8 of paths[1])(8)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

% tail
clearxy;
z0 = (xpart (point infinity of paths[1]), -descent );
z1 = ((x0 + x2)/2, y0 );
z2 = (xpart (point 9 of paths[1]) + thick/2, y0);

paths[2]:= z0{dir 20}..z1..{dir 20}z2;
pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
rbearing:=rbearing - thick;
endglyph;
