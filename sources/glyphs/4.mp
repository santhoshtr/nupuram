input glyph;
beginglyph;
z0=(x1+mw/2, X);
z1=(0, X/4);
z2=(x1+.75mw, y1);
z3=(x0, 2/3X);
z4=(x0, 0);

paths[0] = z0{dir 250}..z1;
paths[1] = z1{dir 10}..{dir 10}z2 ;
paths[2] = z3{dir -80}..{dir -80}z4 ;

pen_stroke(
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[2])(strokes[2]);
endglyph;