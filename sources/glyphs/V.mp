input glyph;
beginglyph;
z0=(0, X);
z1=(x0 + Xw/3, 0);
z2=(x1 + Xw/3, y0);
paths[0] = z0{dir -60}.. z1 ;
paths[1] = z1{dir 60}..{up}z2 ;
pen_stroke(
    nib(terminalnib rotated 30)(0)
    nib(thinterminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 150)(infinity)
)(paths[1])(strokes[1]);
endglyph;
