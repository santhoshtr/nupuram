input glyph;
beginglyph;
w := s/2;
z0= (0, s);
z1=( x0, y0 - 0.8s);

paths[0] = z0..z1;
paths[1] = fullcircle scaled (thick*1.2) shifted(0, 0);

pen_stroke(

    nib(terminalnib rotated 0)(0)
    nib(thinterminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
strokes[1] = paths[1];

endglyph;
