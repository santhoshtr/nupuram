input glyph;
beginglyph;
paths[0] = (0, X){dir 10} .. {dir 10}(sw/2, X);


pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor( "top", (sw/4, X) );
endglyph;
