input glyph;
beginglyph;
paths[0] = fullcircle scaled (thick*1.25) shifted(0, .33s);
paths[1] = paths[0] shifted(0,0.333s);
strokes[0] = paths[0];
strokes[1] = paths[1];
lbearing := lbearing + thick/2;
rbearing := rbearing + thick/2;
endglyph;
