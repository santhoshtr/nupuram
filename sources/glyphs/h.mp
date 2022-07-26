input glyph;
beginglyph;
path paths[], strokes;
z0=(thick/2, X);
z1=(x0, 0.5X);
z2=(x1, 0);
z3= z2;
z4=(x3+0.4sw, s);
z5=(x4+0.3sw, y4-.5s);
z6=(x5, y5-0.5s);

paths[0] := z0{dir 260} ..z1..{dir 260}z2 ;
paths[1] := z3{dir 80}..z4..{dir 260}z5{dir 260}..z6;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1 )
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[1])(strokes[1]);
endglyph;
