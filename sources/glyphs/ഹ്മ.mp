input glyph;
beginglyph;
paths[0] = pa_mouth;
z5=point infinity of paths[0];
z6=(x5 + 0.6mw, y5);


paths[1] := z5{dir 20}..{dir 0}z6;
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
z0= point infinity of paths[1];
z1=( x0 + mw - thick/2, 0);
z2= (x1, y1 + m/3);
z3= (x2, y2 + m/2);

paths[2] = z0{dir 0}..{dir 20}z1{dir 20}.. z2.. z3;

clearxy;
z0 = (x1 + mw/4, m/4);
z1 = (xpart(point infinity of paths[1]), 2/3m);
z2 = (x1 + mw/2, m);
z3 = (x2 + mw/3, y1);
z4=  point 0.2 of paths[2];
paths[3] = z0..z1..z2..z3{dir -100}..{dir 200}z4;


pen_stroke(
    nib(thicknib rotated 0 )(0, 2 )
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thicknib rotated 0 )(0, 4 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor( "vc", point 0.5 of paths[1]);
anchor( "right", point 1 of paths[2]);
endglyph;
