input glyph;
beginglyph;
w := 0.5X;
z0=(x1 + mw/8, X);
z1=(0, y0 - 0.5X);
z2=(x1 + mw/8, 0);
z3=(x2 + 0.7w, y2 + 0.75X);
z4=(x3 + 0.7w, 0);
z5=(x4 + mw/8, y4 + 0.5X);
z6=(x5 - mw/8 , X);
paths[0] = z0 ..z1.. z2;
paths[1]  =z2..{up}z3;
paths[2] = z3{down}..{dir -45}z4;
paths[3] = z4..z5.. z6  ;
pen_stroke(
    nib(thicknib rotated 0 )(2,   4 )
    nib(thinnib rotated 0 )(1, 3, 5)
    nib(terminalnib rotated 135)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 30)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(terminalnib rotated 30)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thicknib rotated 0 )(2, 4 )
    nib(thinnib rotated 0 )(1, 3, 5)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 210)(infinity)
)(paths[3])(strokes[3]);
endglyph;
