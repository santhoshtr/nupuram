input glyph;
beginglyph;

z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, m);
z3=(x2 + mw/3, m/2);
z4=(x3, m/6); % bottom of piller
paths[0] = z0..z1.. z2.. {down}z3---z4 ;
paths[0] :=paths[0] shifted (mw/3, 0);

clearxy;
z0= point 3 of paths[0];
z1=(x0 + mw/3, 0.9m); % Top of second arch
z2=(x1 + mw/4 , m/2);
z3= ( x2 + mw/4, 0.05m);
z4 = ( x3 + mw/3, m/2);

paths[1] = z0{dir 90}..z1{dir -20}..{dir -80}z2{dir -80}..z3{dir -20}..{up}z4;
paths[1]:= paths[1] slanted tand(8) shifted (-tand(8)*mw/2, 0);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(2, 4, 6)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
clearxy;
z0=(xpart(point infinity of paths[1]), m-m/6); % top of piller
z1=(x0, m/2);
z2=(x1 +  mw/3, y1 - m/2); % Top of second arch
z3=(x2 +  mw/3, y2 + m/2);
z4=(x3 -  mw/3, y3 + m/2);

paths[2] = z0---z1..z2{dir -10}..z3..z4;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);


clearxy;
z0 = point 3 of paths[2];
z1 = (xpart(point 2 of paths[2]), -descent - thick/2  );
z2 = (xpart(point 2 of paths[0]), -descent - thick/4);
z3 = (xpart(point 1 of paths[0]) - mw/3, ypart(point 1 of paths[0]));
z4 = (x3 + mw/10, m);

paths[3] = z0{dir -75} ..{dir 200}z1 ..{dir 160}z2  ..z3..z4;
pen_stroke(
    nib(thinnib rotated 0 )(3)
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor( "vc", point 2 of paths[1]);
anchor( "right", point 1 of paths[3]);
endglyph;
