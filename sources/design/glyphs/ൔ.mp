input glyph;
beginglyph;
path paths[], strokes;
z0=(1.5u, 2u);
z1=(x0 - 1u, y0 + 0.3m);
z2=(x0 + 1u, y1 + 0.3m);
z3=(x2 + 1.5u, y2 - 0.3m);
z4=(x1, 0);
z5=(x4, 0);
z6=(x5 + 0.75m, y5);
z7=(x6, y6 + m*0.5);
z8=(x7, y7 + m*0.75);

paths[0] = z0{dir 135}..z1..{right}z2..z3{dir 260}..tension 2.. {dir 240}z4{dir 30}..{dir30}z6{dir 30}..z7...{dir 60}z8;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3,6)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 120)(infinity) % Sharp cut
)(paths[0])(strokes[0]);



% draw strokes[1];

% draw strokes[0] withpen finenib withcolor 0.5green;
% draw strokes[1] withpen finenib withcolor 0.5green;

endglyph;
