input glyph;
beginglyph;
z0=( mw/3, m);
z1=(x0 -  mw/3, y0 - m/2);
z2=(x1 +  mw/3, y1 - m/2);
z3=(x2 +  mw/3, y2+ m/2);
z4=(x3, y3+m/3); % bottom of piller
z5=(x3, y3);
z6=(x5 +  mw/3, y5 - m/2); % Top of second arch
z7=(x6 +  mw/3, y6 + m/2);
z8=(x7, y4);
z9 = z7;
z10 =(x9+ mw/3, 0);
z11 =(x10+ mw/2, y10+ m/2);
z12 =(x9, ascent);
paths[0] = z0..z1..{dir 10}z2.. z3---z4;
paths[1] = z4---z5..z6{dir -10}..z7---z8;
paths[2] = z9{down}..z10..z11..z12;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6)
    nib(thinnib rotated 0 )(1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

endglyph;
