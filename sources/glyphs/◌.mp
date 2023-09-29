input glyph;
beginglyph;

clearxy;
z0=(0, (y1+y3)/2);
z1=((x2+x0)/2, m);
z2=(x0+mw , y0);
z3=(x1, 0);
z4=(x0, y0);

path fpath; fpath:= z0{dir 90}..z1{dir 4}..z2{dir 266}..z3{dir 184}..{dir 90}z0;
soften:=0;
for j=0 upto 3:
    paths[j] := subpath(j, j + .5) of fpath;
    pen_stroke( cut(thinnib, rel 90)(0,1, 2))(paths[j])(strokes[j]);
endfor;


endglyph;
