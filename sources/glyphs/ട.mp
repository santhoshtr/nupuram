input glyph;
beginglyph;


paths[0] := subpath(0,2.8) of top_arch_ac .. subpath(1.2,4) of bottom_arch;

pen_stroke(
    nib(thicknib rotated 0 )(1,3,4, 6)
    nib(thinnib rotated 0 )(2,5)
    nib(thinterminalnib rotated 0 )(0 )
    nib(thinterminalnib rotated 0 )(infinity )
)(paths[0])(strokes[0]);


endglyph;
