input glyph;
beginglyph;
z0=(0.66sw, 0.85X);
z1=(x0 - 0.45sw, 0.9X);
z2=(x1, 3/4s);
z3=(x2-thick/4, 0);
path head;
head = z0{dir 120} ..{dir 250}z1;
head := head slanted .16;
head := head shifted (-sw/6, 0);
paths[0] = head.. z2{down}..  {dir 250}z3;

z10=(x0 , 0.9X);
z11=(x10, s/3);
z12=(x11  + thick/4, thick/2);
z13=(x12 + 0.4sw, s/4);
%bar
z4 = (x2 -0.25sw,s-thick/2);
z5 = (x10 + sw/4,y4);

paths[1] = z10{dir -90}..z11{down}..z12{dir -60}..{dir 60}z13;
paths[2]:= z4{dir 10}..{dir 10}z5;
pen_stroke(
    nib(thicknib rotated 0 )(0 )
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thicknib rotated 0 )(0 )
    nib(thinnib rotated 0 )(1,2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
