input glyph;
beginglyph;
paths[0] = (0, s/2){dir 10} .. {dir 10}(0.75sw, s/2);
pen_stroke(
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;
