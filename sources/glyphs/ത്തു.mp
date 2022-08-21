input glyph;
beginglyph;
z0 = (mw/3, 0);
z1 = ( x0 - mw/3, y0 + m/2); % leftmost
z2 = ( x1 + mw/2.5, y1 + m/2); % top
z3 = ( x2 + mw/2, y2 - m/2);
z4 = ( x3 - mw/4, y3 - m/3); % bottom middle
z5 = ( x4 - mw/4, y4 +  m/3);
z6 = ( x5 + mw/2.4, y5+ m/3); % second top
z7 = ( x6 + mw/3,  y6 - m/2);
z8 = ( x7,  y7 - m/4); %
paths[0] = z0  ..z1..z2 .. z3..z4..z5 ..z6 .. z7 --- z8;
paths[1] =  reverse( paths[0] reflectedabout((.5,-1),(.5,+1)) shifted (x7*2,0) );
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6  )
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


z9 = point 8 of paths[1];
z10 = (x8, -descent );
paths[1] := paths[1]   .. {dir 210}z10;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4,6  )
    nib(thinnib rotated 0 )(1, 3, 5, 7, 8 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

z12 = (x10, -descent );
z13 = (xpart(point 6 of paths[1]), y12 );
z14 = (xpart(point 7 of paths[1]), y12);
paths[2] = z12{dir 20}..z13{dir -20}..z14;
pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
