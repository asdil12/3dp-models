$fn = 20;

spkr_height = 2.7;
top_base = 6.4;
mid_height = top_base - spkr_height;

difference() {
    union() {
        //bottom
        difference() {
            cube([5+5, 4+5, spkr_height]);
            translate([5, 4, 0]) cube([5, 5, spkr_height]);
        }

        // middle
        translate([0, 0, spkr_height]) cube([5+5, 4+5, mid_height]);
        // holding pin
        translate([5+2.95, 4+2.95, 0]) cylinder(h=spkr_height, d=2.6);

        // top
        difference() {
            translate([0, 0, top_base]) cube([5+5, 4+5+5, 1.8]);
            translate([2.6, 4+5+2.6, top_base]) cylinder(h=1.8, d=3.3);
            translate([5, 4+5, top_base]) cube([5, 5, 1.8]);
        }
    }
    translate([0, 0, 1.5]) cube([5+5, 2, 10]);
}
