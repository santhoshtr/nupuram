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

%bar
z4 = (0, s);
z5 = (x0, y4);

paths[1] = z4{dir 10}.. z5;
pen_stroke(
    nib(thicknib)(0)
    nib(thinnib)(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
rbearing:=-1*rbearing;
endglyph;
