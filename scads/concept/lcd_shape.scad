$fn=24;

h=16;
l=60;
w=100;
intersection() {
hull() for(x=[-w/2,w/2]) for(y=[-l/2,l/2]) translate([x,y,h/8]) sphere(r=h,center=true);
cube([2*w,2*l,h],true);
}