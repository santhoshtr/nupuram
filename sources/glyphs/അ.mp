input glyph;
beginglyph;
z0 = ( x1 + 0.3m, 0);
z1 = ( 0, (y0 + y2)/2);
z2 = ( x1 + mw/2, y0 + 1.1m); % top
z3 = ( x2 + mw/4, y0 + m/2); % <
z4 = ( x3 + 0.25mw, y3-m/4);
z5 = ( x4 - 0.25mw, y0);
z6 = ( x5 - mw/3, y5 + m/2.5);
z7 = ( x6 + mw/2.5, y6 + m/2);   % top
z8 = ( x7 + mw/2, y7-m/2.5);
z9 = ( x8, y8 - m/3);
paths[0] = z0..z1..z2..{left}z3{right}..z4..z5..{up}z6..z7..{down}z8---z9;
pen_stroke(
    nib(thicknib rotated 0 )(2, 3, 5 )
    nib(thinnib rotated 0 )(1, 4, 6, 8)
    nib(thinterminalnib rotated terminalangle 3 of paths[0])(3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0 = (xpart(point infinity of paths[0]), ypart(point 8 of paths[0]));
z1= ( x0 + mw/2, y0 + m/2);
z2= ( x1 + mw/2.5, y0);
z3= ( x2 - mw/3, y2 - m/2);
z4= ( x3 - mw/4, y3 + m/3);

paths[1] = z0{up}..z1..z2..{left}z3{left}..{dir 80}z4;
% Correction to avoid wrong outline
delta = thick*0.15;
z15 = point 1.8 of paths[1] - (delta, 0);
paths[1] := paths[1] ..  z15 ;

pen_stroke(
    nib(thicknib rotated 0 )( 3, 6 )
    nib(thinnib rotated 0 )(2,4,6 )
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
