input glyph;
beginglyph;
z0=(0.5sw, X);
z1=(x0-0.3s, 0.9X);
z2=(x1, 0.5s);
z3=(x2, 0);
%bar
z4 = (x2 -0.25sw,s);
z5 = (x4 + 0.5sw,y4);
paths[0] = z0 ..z1..  z2..z3;
paths[1] = z4{dir 20}..{dir 20}z5;
pen_stroke(
    nib(thicknib rotated 0 )(0 )
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated 90)(0)
    nib(thinterminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);
endglyph;
