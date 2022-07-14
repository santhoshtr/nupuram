input glyph;
beginglyph;
path paths[], strokes;
z0=(1.5u, -1u);
z1=(x0- 1u, 0.25m);
z2=(x0 + 1u, y1 + 0.25m);
z3=(x2 + 1.5u, y2-m*0.25);
z4=(x2, 0);
z5=(x4, 0);
z6=(x5 + 0.6m, y5);
z7=(x6 - 0.2m, y6 + m*0.5);
z8=(x7 + 0.4m, y7 + m*0.5);
z9=(x8 + 0.4m, y8- m*0.5);
z10=(x9-0.3m, y9 - m*0.5);

paths[0] = z0{dir 135}..z1..{right}z2..z3{dir 260}..z4;
paths[1] := z5{dir 30}..{dir30}z6{dir 120}..{up}z7{up}..{right}z8{right}..z9{down}.. z10;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5, 6 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 120)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3, 5)
    nib(default_nib xyscaled(thin, 1.6) rotated 0 )(2, 4)
    nib(default_nib xyscaled(1 ,terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
find_outlines(soften_path(strokes[0], 10), soften_path(strokes[1],10))(r);

% draw strokes[1];

% draw strokes[0] withpen finenib withcolor 0.5green;
% draw strokes[1] withpen finenib withcolor 0.5green;

endglyph;
