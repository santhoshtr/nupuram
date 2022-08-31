input glyph;
beginglyph;


clearxy;
z0=(0, 0);
z1=( mw - thick/2, 0);
z2= (x1, y1 + m/3);
z3= (x2, y2 + m/2);

paths[1] = z0{dir 20}..{dir 20}z1{dir 20}.. z2.. z3;
paths[1]  := paths[1] shifted (mw/3, 0);

clearxy;
z0 = (x1 +mw/4, m/4);
z1 = (xpart(point 0 of paths[1]), 2/3m);
z2 = (x1 + mw/2, m);
z3 = (x2 + mw/3, y1);
z4=  point 0.2 of paths[1];
paths[0] = z0..z1..z2..z3{dir -100}..{dir 200}z4;


pen_stroke(
    nib(thicknib rotated 0 )(0, 2 )
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(0, 4 )
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

clearxy;
z0 = point 1.5 of paths[1];
z1 = (xpart(point 2 of paths[0]), -descent - thick/2  );
z2 = (xpart(point 0 of paths[1]) - mw/3, m/3);
z3 = (x2 + mw/10, m);

paths[2] = z0{dir -80} .. z1  .. z2 .. z3;
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", (xpart(point 2 of paths[0]),0));
anchor( "bottom", point 0.5 of paths[2]);
anchor( "right", point 0.5 of paths[2]);

endglyph;
