input glyph;
beginglyph;
paths[0] = (0, 0.95X){dir 45} .. {dir 45}(0.6sw, X);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor("top", (xpart(point 0.5 of paths[0]), X));
endglyph;
