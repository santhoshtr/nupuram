input glyph;
beginglyph;


z0 =(u, m/3.5);
z1 =(x0 + mw/4, y0 + m/4);
z2 = (x1 + mw/4, y1 - m/4);
z3 = ( x2- mw/4, y2 - m/4);
z4 = ( x3 - m/4, y3 + m/2);
z5 = ( x4 + 0.75m, y4 + m/2); % top
z6 = ( x5 + 0.2mw, y5 - m/2); % <
z7 = ( x6 + 0.25mw, y6-m/4);
z8 = ( x7 - 0.25mw, y7-m/4);
z9 = ( x8 - m/3, y8 + m/2.5);
z10 = ( x9 + m/3, y9 + m/2);   % top
z11 = ( x10 + mw/2, y10-m/2.5);
z12 = ( x11, y11 - m/2);

z20 = ( x11, y11 );
z21 = ( x20 + m/3, y20 + m/2);
z22 = ( x21 + m/3, y21 - m/4);
z23 = ( x22 - m/3, y22 - m/4);



paths[0] = z0..z1..z2..z3..z4{dir 80}..z5..{left}z6{right}..z7..z8..{up}z9..z10..{down}z11---z12;
paths[1] = z20{up}..z21..z22..{left}z23{left} ;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2, 3, 5 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2, 4,7,9,11)
    nib(default_nib xyscaled(1,terminalround) rotated 60)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 90)(6) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(0 ) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 3, 6 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2,4,6 )
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(infinity) % Sharp cut
)(paths[1])(strokes[1]);


z30 = z23;
z31 = (x30 + mw/2, y30 - m/4);
z32 = (x31 - mw/2, y31 - m/4);
paths[2] = z30{right}..z31..z32 ;
pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(1,terminalround) rotated 120)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 60)(infinity)
)(paths[2])(strokes[2]);
endglyph;
