input glyph;
beginglyph;
z0=(x1 + mw/2, X);
z1=(0, X/4);
z2=(x1+.75Xw, y1);
z3=((x1+x2)/1.5, (y0+y1)/2);
z4=(x3, 0);

paths[0] = z0{dir 250}..z1;
paths[1] = z1{dir 10}..{dir 10}z2 ;
paths[2] = z3{dir -80}..{dir -80}z4 ;

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;