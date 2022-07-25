input glyph;
beginglyph;
path paths[], strokes;
z0=(1u, X);
z1=(x0 - 0.5u, 0.5X);
z2=(x1, 0);
z3=(x2 + 4u, y2 + 0.025X );
paths[0] = z0 ..z1..{dir 240}z2{dir 30}..{dir 30}z3;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 3, 5 )
    nib(thinnib rotated 0 )(1,   4, 6)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[0])(strokes[0]);
endglyph;
