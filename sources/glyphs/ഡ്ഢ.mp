input glyph;
beginglyph;
z0 = (x1 + mw/3, 0);
z1 = (0,  m/2);
z2 = ( x1 + mw/3, y1 + m/2);
z3 = ( x2 + mw/3, m/2);
z4 = ( x3 + mw/4, 0);
z5 = (x4 + mw/3, m/2);

loop_slant:=tand(8);
paths[0] := z0{dir 140}..z1..z2..z3{dir -100}..z4..{up}z5;
paths[0]:=paths[0] slanted loop_slant;
paths[0]:=paths[0] shifted (-loop_slant*m/2,0);

pen_stroke(
    nib(thicknib rotated 0 )( 0, 2,4,6 )
    nib(thinnib rotated 0 )( 1, 3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0=(xpart(point infinity of paths[0]), m-m/6); % top of piller
z1=(x0, m/2);
z2=(x1 +  mw/3, y1 - m/2); % Top of second arch
z3=(x2 +  mw/3, y2 + m/2);
z4=(x3 -  mw/3, y3 + m/2);

paths[1] = z0---z1..z2{dir -10}..z3{dir 100}..z4;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

clearxy;
z0 = (x1 + mw/3, 0);
z1 = (0,  m/2);
z2 = ( x1 + mw/3, y1 + m/2);
z3 = ( x2 + mw/3, m/2);
z4 = ( x3 + mw/4, 0);
z5 = (x4 + mw/3, m/2);

% loop_slant:=tand(8);
paths[2] := z0{dir 140}..z1..z2..z3{dir -100}..z4..{up}z5;
paths[2]:=paths[2] slanted loop_slant;
paths[2]:=paths[2] shifted (-loop_slant*m/2,0);


clearxy;
z0=(xpart(point infinity of paths[2]), m-m/6); % top of piller
z1=(x0, m/2);
z2=(x1 +  mw/3, y1 - m/2); % Top of second arch
z3=(x2 +  mw/2, y2 + m/2);
z4=(x3 -  mw/3, m);
z5=(x4 -  mw/4, y4 - m/3);
z6=(x3 - thick*0.20, y3);

paths[3] = z0---z1..z2{dir -10}..z3{dir 90}..{left}z4..z5..z6;

paths[2]:=paths[2] shifted (m*0.8, -m) xscaled 0.7  yscaled 0.7;
paths[3]:=paths[3] shifted (m*0.8, -m) xscaled 0.7  yscaled 0.7;

pen_stroke(
    nib(thicknib rotated 0 )( 0, 2,4,6 )
    nib(thinnib rotated 0 )( 1, 3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor( "vc", point 5 of paths[0]);

endglyph;
