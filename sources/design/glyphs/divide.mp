input glyph;
beginglyph;
paths[0] = (0, s/2){dir 10} .. {dir 10}(s, s/2);
paths[1] = fullcircle scaled (thick*1.2) shifted(s/2, 0.75s);
paths[2] = fullcircle scaled (thick*1.2) shifted(s/2, 0.25s);

pen_stroke(
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
strokes[1] = paths[1];
strokes[2] = paths[2];
endglyph;
