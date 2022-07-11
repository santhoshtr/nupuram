input glyph;

beginglyph;
path paths[], strokes;

z0=(0.2m, 2u);
z1=(x0 - 0.2m, y0 + 0.3m);
z2=(x1 + 0.4m, y1 + 0.3m);
z3=(x2 + 0.3m, y2 - 0.3m);
z4=(x1, 0);
z5=(x4, 0);
z6=(x5 + 0.76m, y5);
z7=(x6, y6 + m*0.25);
z8=(x7, y7 + m*0.25);



paths[0]:= z0..z1{up}..{right}z2..z3{down}.. {dir 240}z4{dir 30}..{dir30}z6{dir 30}..z7...{dir 60}z8;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3,6)
    nib(default_nib xyscaled(xthick,.1) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(1,.1) rotated 30)(infinity) % Sharp cut
)(paths[0])(strokes[0]);




% draw strokes[1];


% draw strokes[0] withpen finenib withcolor 0.5green;
% draw strokes[1] withpen finenib withcolor 0.5green;


endglyph;
end