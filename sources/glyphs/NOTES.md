Letter n proportions

```
path s,l;
h=10;
pickup pencircle scaled .1;
slant = .16;
z0=(0,h);
z1=(0,h/2);
z2=(0,0);
l=z0--z1--z2;

z3 = z1;
z4 = (x3 + h/3, h);
z5 = (x4+ h/3,  y4 - h/2);
z6 = (x5-h/3,   0);

s = z3..z4..z5..z6..cycle;
s:=s slanted slant;
s:=s shifted (-slant*h/2, 0);
s:=s cutafter point 1.8 of s;

s:=s..(x5,0);
draw s withcolor red;
draw l withcolor red;
```

letter r proportions
```
path s,l;
h=10;
pickup pencircle scaled .1;
u:=1.6;
z0=(0,h);
z1=(0,h/2);
z2=(0,0);
l=z0--z1--z2;

z3 = z1;
z4 = (x3 + h/3, h);
z5 = (x4+ h/3,  y4 - h/2);
z6 = (x5-h/3,   0);

s = z3..z4..z5..z6..cycle;
s:=s slanted .2;
s:=s cutafter point 1.25 of s;

s:=s shifted (-1, 0);

draw s  withcolor red;
draw l withcolor red;
```

Letter p
```
path s,l;
h=10;
pickup pencircle scaled .1;
u:=1.6;
z0=(0,h);
z1=(0,h/2);
z2=(0,-h/3);
l=z0--z1--z2;

z3 = z1;
z4 = (x3 + h/3, h);
z5 = (x4+ h/3,  y4 - h/2);
z6 = (x5-h/3,   0);

s = z3..z4..z5..z6..cycle;
s:=s slanted .2;
s:=s cutafter point 3.56 of s;

s:=s shifted (-1, 0);

draw s  withcolor red;
draw l withcolor red;
```


Letter a
```
path s,l;
h=10;
pickup pencircle scaled .5;
u:=1.6;
z0=(h/2,h);
z1=(x0,h/2);
z2=(x0,0);
l=z0--z1--z2;

z3 = z1;
z4 = (x3 - h/3, h);
z5 = (x4 - h/3,  y4 - h/2);
z6 = (x5 + h/3,   0);

s = z3..z4..z5..z6..cycle;
s:=s slanted .2 shifted (-1, 0);
s:=s cutbefore point 0.42 of s;


draw s  withcolor red;
draw l withcolor red;
```

Letter c
```
path s,l;
h=10;
pickup pencircle scaled 1;
slant = .16;

z3 = (0,h/2);
z4 = (x3 - h/3, h);
z5 = (x4-h/3,  y4 - h/2);
z6 = (x5+h/3,   0);

s = z3..z4..z5..z6..cycle;
s:=s slanted slant;
s:=s shifted (-slant*h/2, 0);
s:=s cutbefore point .4 of s;
s:=s cutafter point 3.6 of s;
draw s withcolor red;

 ```

Letter e
```
path s;
h=10;
pickup pencircle scaled 1;
slant = .16;

z3 = (0,h/2);
z4 = (x3 - h/3, h);
z5 = (x4-h/3,  y4 - h/2);
z6 = (x5+h/3,   0);
z7 = (x6+h/2,  h/2);
s = z3..z4..z5..z6..z7;
s:=s slanted slant;
s:=s shifted (-slant*h/2, 0);
s:=s cutbefore point .4 of s;
s:=s cutafter point 3.6 of s;
s:=point 2 of s{dir -30}..s;
draw s withcolor red;


``

Eye of kha
```
path s,l;
h=10;
pickup pencircle scaled .1;
slant = -0.05;

z0 = (0, h/2);
z1 = (x0 - h/3, y0 + h/2);
z2 = (x1 - h/3, y1 - h/2);
z3 = (x2 + h/3, 0);
x0:=x3+h/3;
s = z0..z1..z2..z3..cycle;
s:=s slanted slant;
s:=s shifted (-slant*h/2, 0);
s:=s cutbefore point 1.8 of s;
s:=s cutafter point 2.5  of s;
s:=s..point 0.2 of s;
s:=(h/2, 0)---(h/2,h/2)..s;
draw s withcolor red;

```
Attempt to draw outline of s using penstroke. Not working
```
path s;
w=1;
rot =90;
pickup pencircle scaled .1;
u:=1.6;
z1 =(0,1);
z2 = (2*u, 0);
z3 =(4*u,2);
z4 = (2u, 5.5);
z5= (0,8);
z6=(2u,10);
z7=(3.5u,9);
s =   z1..z2..z3..z4..z5..z6..z7;

draw s withcolor red;
for i:=1 upto 7:
pair v;
if i = 7:
v = z[i-1]-z[i];
else:
v:=z[i]-z[i+1];
fi;
v:=direction i of s;

z[i]=1/2[z[i]l,z[i]r]  ;
z[i]r-z[i]l  = (w,0) rotated (angle(v)+90);
endfor;

draw z1l..z2l..z3l..z4l..z5l..z6l..z7l withcolor green;
draw z1r..z2r..z3r..z4r..z5r..z6r..z7r withcolor blue;
```

