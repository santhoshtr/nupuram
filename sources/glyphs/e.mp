input glyph;
beginglyph;

z0 = ((phi-1)*sw + thick/2 , 3/4s);
z1 = (x0 - (phi-1)*sw/2 , s - thick/4);
z2 = (x0 - (phi-1)*sw , y1 - (phi-1)*s );
z3 = (x1, thick/4);
z4 = (x2 + (phi-1)*sw  + thick/4 ,  s/3);
z5 = (x2, y2);
paths[0] = z5{right}..z0{dir 90} ..z1.. z2 ..z3..{dir 80}z4;



pen_stroke(
    nib(thicknib rotated 0 )(2,4)
    nib(thinnib rotated 0 )(1,3)
    nib(thinterminalnib rotated 90 )(0 )
    nib(thinterminalnib rotated 120 )(infinity )
)(paths[0])(strokes[0]);


endglyph;
