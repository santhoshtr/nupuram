input glyph;
beginglyph;
z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y1);
z4=(x3 + mw/2, m);
z5=(x4 + mw/3, y4-m/4);
z6=(x5 - mw/3, y5-m/4);
z7=(x6 + mw/2.5, y6-m/4);
z8=(x7 - mw/2, y7-m/4);
paths[0] = z0..z1{down}..{right}z2{right}..z3..{right}z4..z5..{left}z6{right}..z7..{dir 160}z8;
paths[0] := paths[0] shifted(mw/3,0);
pen_stroke(
    nib(thicknib)(0, 2)
    nib(thinnib)(1,3, 5,7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 6 of paths[0])(6)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


clearxy;
z0=point 7.9 of paths[0];
z1=(x0 + 0.8mw, mw/2);
paths[1] = z0{dir -20}..{up}z1;
pen_stroke(
     nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
clearxy;
z0=(xpart(point infinity of paths[1]), m-m/6); % top of piller
z1=(x0, m/2);
z2=(x1 +  mw/3, y1 - m/2); % Top of second arch
z3=(x2 +  mw/3, y2 + m/2);
z4=(x3 -  mw/3, y3 + m/2);

paths[2] = z0---z1..z2{dir -10}..z3{dir 100}..z4;
pen_stroke(
    nib(thicknib)(1, 3, 5, 7)
    nib(thinnib)(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

clearxy;
z0 = point 2.8 of paths[2];
z1 = (xpart(point 1 of paths[1]), -descent - thick/2 );
z2 = (xpart(point 2.25 of paths[0]), -descent - thick/2);
z3 = (xpart(point 1 of paths[0]) - mw/3, ypart(point 1 of paths[0]));
z4 = (x3 + mw/10, m);
paths[3] =  z0{dir -90} ..{dir 200}z1 ..{dir 160}z2  ..z3..z4;

pen_stroke(
    nib(thinnib)(3)
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);


anchor("vc", point 5 of paths[0]);
anchor("bottom", point .6 of paths[3]);
anchor("right", point .6 of paths[3]);
endglyph;
