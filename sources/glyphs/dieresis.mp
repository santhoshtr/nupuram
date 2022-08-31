input glyph;
beginglyph;
paths[0] = fullcircle scaled (thick*1.5) shifted(thick, X);
paths[1] = paths[0] shifted(3*thick, 0);
strokes[0] = paths[0];
strokes[1] = paths[1];
anchor( "top", (2.5*thick, X) );
endglyph;
