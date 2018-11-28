fn=100;

difference() {
cube([30,8,7], true);

translate([0, 0, -((7-5.6)/2)])
cube([13.3,9,5.6], true);

translate([0, -3, -((7-6.2)/2)])
cube([14.8,0.5,6.2], true);

translate([(-11.75),0.5,0])    
cylinder(30, 2/2, 2/2, true, $fn=fn);
    
translate([(+11.75),0.5,0])    
cylinder(30, 2/2, 2/2, true, $fn=fn);
}