input glyph;
beginglyph;
paths[0] = (0, s/2){dir 10} .. {dir 10}(0.75sw, s/2);
paths[1] = paths[0] shifted(0, s/3);
pen_stroke(
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);
endglyph;
