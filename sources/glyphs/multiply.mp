input glyph;
beginglyph;
% It is easy to imagine an asterisk as 3 lines going through a center point
% in different angles. But that would be a dull asterisk
% Here we add a little bit curviness to all the lines to get a 'warm' star
z0 = (0.1s, s);
z1 = (s*0.9, 0);

z2 = (x1, y0);
z3 = (x0, y1);

z4 = (0, s/2);
z5 = (s*1.05, y4);
% The center points
z6 = (0.55s, 0.55s);
z7 = (0.55s, 0.45s);
% Top left to bottom right
paths[0] := z0..z6..z1;
% Top right to bottom left
paths[1] := z2..z7..z3;


pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


endglyph;
