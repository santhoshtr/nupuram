input glyph;
beginglyph;
paths[0] = pa_mouth;

clearxy;
z0=point infinity of paths[0];
z1=(x0 + mw, y0);

paths[1] := z0{dir 20}..{dir 20}z1;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2,4,6)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated (terminalangle infinity of paths[1]))(infinity)
)(paths[1])(strokes[1]);

clearxy;
z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3,  y3 -m/4); % bottom of piller
paths[2] = z0..z1.. z2.. {down}z3---z4 ;
paths[2] := paths[2] shifted(xpart(point infinity of paths[1]) - mw/3, 0);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);


clearxy;
z0=point 3 of paths[2];
z1=(x0 + mw/2, m); % Top of second arch
z2=(x1 + mw/3, y1 - m/2);
z3= ( x2 - mw/3, y2 - m/2);
z4= ( x3 - mw/4, y3 + m/3);
z5= ( x4 + mw/2, y4 +  m/3);
z6= ( x5 + mw/3, y5 - m/3 );
z7= ( x6 - 0.7mw, -descent );
paths[3] = z0{up}..z1..z2..z3..z4..z5..z6..{dir 150}z7;
paths[3]:= paths[3] slanted tand(8) shifted (-tand(8)*mw/3, 0);

pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(0, 2, 4, 6)
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor( "vc", point 0.5 of paths[1]);
endglyph;
