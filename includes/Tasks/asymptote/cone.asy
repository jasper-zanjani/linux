import solids;

// Set page size
size(0,150);

// Lighting
currentlight=Viewport;

// Draw axis
draw(Label("$y$",1),(0,0,0)--(0,1,0),red,Arrow3);
draw(Label("$x$",1),(0,0,0)--(1,0,0),red,Arrow3);
draw(Label("$z$",1),(0,0,0)--(0,0,1),red,Arrow3);

// Draw cylinder
// cylinder(startpoint3d, radius, length, along_this_axis)
triple start = (1,1,1);
real length = 1;
real radius = 0.5;
triple ax = (1,0,0);
revolution r = cylinder(start,radius,length,ax);
draw(r,black);