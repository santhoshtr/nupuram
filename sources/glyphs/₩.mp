input glyph;
beginglyph;
z0=(0, X);
z1=(x0 + Xw/3, 0);
z2=(x1 + Xw/3, y0);
paths[0] = z0{dir -60}.. z1 ;

paths[2] := paths[0] shifted (0.5Xw, 0);
paths[1] =  z1{dir 60}..{up}(point .3 of paths[2]) ;
paths[3] := (z1{dir 60}..{up}z2 ) shifted (0.5Xw, 0);
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
    nib(thinterminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

paths[4] = (0, 0.75X){dir 10} .. {dir 10}(xpart(point 1 of paths[3])*1.1, 0.75X);
paths[5] = (0, X/2){dir 10} .. {dir 10}(xpart(point 1 of paths[3])*1.1, X/2);
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[4])(0)
    nib(terminalnib rotated terminalangle infinity of paths[4])(infinity)
)(paths[4])(strokes[4]);
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[5])(0)
    nib(terminalnib rotated terminalangle infinity of paths[5])(infinity)
)(paths[5])(strokes[5]);
endglyph;
