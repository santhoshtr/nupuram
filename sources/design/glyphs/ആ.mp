input glyph;

beginglyph;
path paths[], strokes;

z0 = ( 0.3m , 0);
z1 = ( x0 - 0.3m , y0 + m/2);
z2 = ( x1 + 0.5m  , y1 + m/2); % top
z3 = ( x2 + 0.2m, y2-m/2); % <
z4 = ( x3 + 0.25m, y3-m/4);
z5 = ( x4 - 0.25m, y4-m/4);
z6 = ( x5 - m/3, y5 + m/2.5);
z7 = ( x6 + m/3, y6 + m/2);   % top
z8 = ( x7 + m/2, y7-m/2.5);
z9 = ( x8, y8 - m/2);


z10 = ( x9, y9 + m/2);
z11= ( x10 + m/2, y10 + m/2);
z12= ( x11 + m/3, y11 - m/2);
z13= ( x12 - m/3, y12 - m/2);
z14= ( x13 - m/4, y13 + m/3);
z15= ( x14 + m/2, y14 + m/3);
z16= ( x15 + m/2, y15 - m/2 );
z17= ( x16 - 0.7m, y16 - m/2 );



paths[0]:= z0..z1..z2..{left}z3{right}..z4..z5..{up}z6..z7..{down}z8---z9;
paths[1]:=z9---z10{up}..z11..z12..{left}z13{left}..z14..z15.. z16.. z17;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2, 3 , 5 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 4, 6, 8)
    nib(default_nib xyscaled(0.8 ,.1) rotated 60)(0, 3) % Sharp cut
    nib(default_nib xyscaled(xthick ,.1) rotated 60)(0 ) % Sharp cut
    nib(default_nib xyscaled(xthick,.1) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 3, 6 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5, 7 )
    nib(default_nib xyscaled(xthick ,.1) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,.1) rotated 90)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

endglyph;
end
