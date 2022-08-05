input glyph;
beginglyph;
path paths[], strokes;
% Left slant
z0=(thick/2, 0);
z1=(x0 + 0.1Xw, y0 + .5X);
z2=(x1 + 0.2Xw, y1 + .5X);

paths[0] = z0..z1..z2;
% Right slant
z3=z2;
z4=(x3 + 0.2Xw, y3 - .5X);
z5=(x4 + 0.1Xw, y4 - .5X);
paths[1] = z3..z4..z5;
% bar
z6 = point 0.8 of paths[0] ;
z7 = point 1.2 of paths[1] ;

paths[2]:= z6 ..z7 ;
pen_stroke(

    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[2])(strokes[2]);

endglyph;
