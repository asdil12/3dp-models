fn=100;

difference() {
cube([30,8,7], true);

translate([0, 0, -((7-5.6)/2)])
cube([13.3,9,5.6], true);

translate([0, -3.4, -((7-6.2)/2)])
cube([14.5,0.5,6.2], true);

translate([(-12.5),1.5,0])    
cylinder(30, 2/2, 2/2, true, $fn=fn);
    
translate([(+12.5),1.5,0])    
cylinder(30, 2/2, 2/2, true, $fn=fn);
}