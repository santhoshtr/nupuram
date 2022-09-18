input glyph;
beginglyph;
loop_slant=tand(-4);
z0 =(x3+thick/4, y3);
z1=(x0 + mw/2, y3 - m/6 );
z2=(x1 - mw/5,  thick/2);
z3=(0, m/2);
z4=(x3 + 0.6mw, m);
z5=(x4 + 0.75mw, m/2);
z6=(x5 - mw/3, 0);
z7=(x6 - mw/4, m/2);
z8=(x7 + mw/4, y7+m/3);
z9=( x8, ascent + .1m);

paths[0]:=z0{dir 30} .. z1{down}..z2{left}..z3.. z4..z5..z6..z7..z8{dir 60}..z9;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6)
    nib(thinnib rotated 0 )(1,3, 5,7,8 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
