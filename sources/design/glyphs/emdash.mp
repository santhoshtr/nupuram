input glyph;
beginglyph;
paths[0] = (0, s/2){dir 10} .. {dir 10}(sw, s/2);
pen_stroke(
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[0])(strokes[0]);
endglyph;
