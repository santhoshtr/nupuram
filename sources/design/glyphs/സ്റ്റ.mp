input glyph;
beginglyph;
z0=(m/3 + 0.5thick, 0);
z1=(x0 - mw/3, y0 + m/2);
z2=(x1 + mw/3, y1 + m/2);
z3=(x2 + mw/3, y2 - m/2);
z4=(x3, y3 - m/3); % bottom of piller
z5=(x3, y3);
z6=(x5 + mw/5, y5 + m/3);
z7=(x6 + mw/5, y6 - m/3);
z8=(x7 + mw/5, y7 - m/2);
z9=(x8 + mw/3, y8 + m/2);
z10=(x9 - mw/3, y9 + m/2);

paths[0] = z0..z1.. z2.. z3---z4 ;
paths[1] =  z5{up}..z6 ..z7...z8..z9 .. z10;

% Ra
z20=(0, 0);
z21=(x20- mw/4, m/2);
z22=(x20 + mw/3, y21 + m/2);
z23=(x22 + mw/3, y22-m/2);
z24=(x22, 0);
paths[2] = z20{dir 135} ..z21..{right}z22..z23{dir 260} ..z24;
paths[2] := paths[2] shifted (mw/3, -y2  ) xscaled 0.8 yscaled 0.8;
paths[3] := paths[2] shifted (mw, 0 );

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 0)(4 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3, 5, 7)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2, 4)
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2,5, 6 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[2])(strokes[2]);

strokes[3] := strokes[2] shifted (mw, 0 );
endglyph;
