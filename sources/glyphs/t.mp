input glyph;
beginglyph;
path paths[], strokes;
z0=(0.15X, X);
z1=(x0, y0-0.6666X);
z2=(x1 + 0.4sw, thick/4);
%bar
z4 = (x0-0.25sw, s);
z5 = (x4 + 0.5sw, y4);
paths[0] = z0..tension 4..z1{down}..{dir 20}z2;
paths[1] = z4{dir 20}..{dir 20}z5;
pen_stroke(
    nib(thicknib rotated 0 )(0  )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated 90)(0)
    nib(thinterminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);
endglyph;
