input glyph;
beginglyph;
paths[0] = (0, s/2+s/4){dir 10} .. {dir 10}(0.75sw, s/2 + s/4);
paths[1] =(0, s/2-s/4){dir 10} .. {dir 10}(0.75sw, s/2-s/4);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
