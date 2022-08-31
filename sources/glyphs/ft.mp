input glyph;
beginglyph;
z0=(0.66sw, 0.85X);
z1=(x0 - 0.5sw, 0.9X);
z2=(x1, 3/4s);
z3=(x1, 0);
path head;
head = z0{dir 120} ..{dir 250}z1;
head := head slanted .16;
head := head shifted (-sw/6, 0);
paths[0] = head.. z2 ..  {dir 260}z3;
clearxy;
z0=(sw/6, 0.95X);
z1=(x0 , 0.66s);
z2=(x1 + sw/4, thick/4);
z3=(x2 + sw/3, s/4);
paths[1] = z0{dir -80}..z1{dir -95}..z2{right}..{dir 60}z3;
paths[1] := paths[1] shifted (sw/2, 0);
%bar
z4 = (x2 -0.4sw,s-thick/2);
z5 = (x2 + sw/2, y4);


paths[2]:= z4{dir 10}..{dir 10}z5;
pen_stroke(
    nib(thicknib rotated 0 )(0 )
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thicknib rotated 0 )(0 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
