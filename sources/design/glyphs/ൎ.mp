input glyph;

beginglyph;

donotsoften := 1;
r := u;
z0=(0, em);
z1=(x0 + r, y0 + r);
z2=(x1 + r, y1 - r);
z3=(x2 - r, y2 - r);
z4=(x3 - r, y3 + r);



paths[0]:= z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;


pen_stroke()(paths[0])(strokes[0]);

endglyph;
