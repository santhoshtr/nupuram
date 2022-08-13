input glyph;
beginglyph;

paths[0] :=left_arch_with_eye;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6)
    nib(thinnib rotated 0 )(1,3, 5 )
    nib(terminalnib rotated 135)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

z10 = point 5 of paths[0];
z12 = ( x10 + m/3, y10 + m/2); % top
z13 = ( x12 + mw/2, y12 - m/2);
z14 = ( x13 - mw/4, y13 - m/3); % bottom middle
z15 = ( x14 - mw/4, y14 +  m/3);
z16 = ( x15 + mw/2, y15 +  m/2); % second top
z17 = ( x16 + m/2.5, y16-m/2);
z18 = ( x17 - m/3, y17-m/2); %

paths[1] = z10{up} ..z12{right}.. z13..z14..z15 ..z16{right}..z17..z18;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7, )
    nib(thinnib rotated 0 )(0, 2, 4,6)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 135)(infinity)
)(paths[1])(strokes[1]);

endglyph;
