input glyph;
beginglyph;
soften := 0;
paths[0] = fullcircle scaled (thick*1.2) shifted(thick/2, s/2);
paths[0] := paths[0] shifted (0, m);
strokes[0] = paths[0];
endglyph;
