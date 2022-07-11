input glyph;

beginglyph;
    path paths[], strokes;
    z0=(3u, 0);
    z1=(x0-2u, y0+ 0.3m);
    z2=(x1+1.5u, y1 + 0.7m);
    z3=(x2+2u, y2-m*0.5);
    z4=(x3, 1u); % bottom of piller
    z5=(x3, y3);
    z6=(x5 + 1.5u, y5 + 0.4m);
    z7=(x6 + 1u, y6 - 0.45m);
    z8=(x7 + 1u, 0);
    z9=(x8  + 2u, y8 + 0.7m);
    z10=(x9 - 1.5u, y9 + 0.3m);


    paths[0]:= z0..z1..{right}z2.. z3---z4 ;
    paths[1]:=  z5{up}..z6..{dir 245}z7{dir 245}...z8..z9 ..{dir 135}z10;

    pen_stroke(
        nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2)
        nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3)
        nib(default_nib xyscaled(xthick,.11) rotated 45)(0)
        nib(default_nib xyscaled(1,.11) rotated 10)(4 )
    )(paths[0])(strokes[0]);
    pen_stroke(
        nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3, 5, 7)
        nib(default_nib xyscaled(thin, thin) rotated 0 )(2, 4)
        nib(default_nib xyscaled(thin,.11) rotated 0)(0)

        nib(default_nib xyscaled(xthick,.11) rotated 45)(infinity)
    )(paths[1])(strokes[1]);

    find_outlines(soften_path(strokes[0], 10),soften_path(strokes[1], 10) )(r);









endglyph;
end