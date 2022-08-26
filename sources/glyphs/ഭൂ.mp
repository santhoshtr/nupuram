input glyph;
beginglyph;

z0 = ( x1 + mw/8, 0);
z1 = ( 0, y0 + m/2 );
z2 = ( x1 + mw/2, m); % top
z3 = ( x2 + mw/3, y2 - m/5);
z4 = ( x3 - mw/4, y3 - m/6);
z5 = ( x4 - mw/4, m/2);
z6 = ( x5 + mw/4, y5 -m/6);
z7 = ( x6 + mw/3, y6-.15m);
z8 = ( x6 , 0);
z9 = ( x5 , thick/2);

paths[0] = subpath(0,2) of da;
paths[0] := paths[0]..z3 ..{left}z4  .. z5 ..z6{right}..z7.. z8..{dir 150}z9;
paths[0] := paths[0] shifted (mw/3, 0);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 4  )
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


%tail
z15=point 8 of paths[0];
z16=(xpart(point 8 of paths[0]) +mw/3, -descent/2);
z17=(xpart(point 8 of paths[0]), -descent-thick);
z18=(xpart(point 1 of paths[0]) - mw/3, m/3);
z19=(x18 + mw/6, m);

paths[1] := z15{dir -5}..z16 ..{left}z17 ..z18..z19 ;


pen_stroke(
    nib(thicknib rotated 0 )( 0, 2,4,6 )
    nib(thinnib rotated 0 )( 1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle 4 of paths[1])(4)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;
