input glyph;
beginglyph;
paths[0] = fullcircle scaled thick shifted(thick, s/3);
paths[1] = paths[0] shifted(2*thick, 0);
paths[2] = paths[0] shifted(4*thick, 0);
strokes[0] = paths[0];
strokes[1] = paths[1];
strokes[2] = paths[2];
endglyph;
