fn=100;

rotate([0, 180, 0]) {
    difference() {
        // main cube
        cube([30,8,7], true);

        // hole for usb port
        translate([0, 0, -((7-5.6)/2)])
        cube([13.3,9,5.6], true);

        // gap for usb port border
        translate([0, -3, -((7-6.2)/2)])
        cube([14.8,0.5,6.2], true);

        // holes for screws
        translate([(-11.75),0.5,0])
        cylinder(30, 2/2, 2/2, true, $fn=fn);
    
        translate([(+11.75),0.5,0])
        cylinder(30, 2/2, 2/2, true, $fn=fn);
    }
}