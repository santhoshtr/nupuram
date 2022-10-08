input glyph;
beginglyph;
% This glyph does not slant. Reset slant value
slant := 0;
paths[0] = (0, 0){dir 10} .. {dir 10}(0.75sw, 0);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
