input glyph;
beginglyph;
% This glyph does not slant. Reset slant value
slant := 0;
z0= (X/2, X);
z1=( X/4, y0 - 0.5X);
z2=( 0, y1 - 0.5X);

paths[0] = z0{dir 255}..z1..{dir 255}z2 ;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
radius:=0.2sw;
clearxy;
z0=(0, X*0.8);
z1=(x0 + radius, y0 + radius);
z2=(x1 + radius, y1 - radius);
z3=(x2 - radius, y2 - radius);
z4=(x3 - radius, y3 + radius);

paths[1] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;
paths[2] = paths[1] shifted(X/3, -0.5X);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0, 2, 4)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0, 2, 4)
)(paths[2])(strokes[2]);
endglyph;
