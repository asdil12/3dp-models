module hdd_plate() {
    intersection() {
        import("Fujitsu_futro_s920_ssd_hdd_holder_250963.stl");
        translate([-10, -10, 0]) cube([100, 100, 1.2]);
    }
}

module base_plate() {
    intersection() {
        import("Fujitsu_futro_s920_ssd_hdd_holder_250963.stl");
        translate([-10, -10, 1.21 + 1]) cube([100, 100, 100]);
    }
}

module low_profile_holder() {
    union() {
        hdd_plate();
        translate([0, 0, -2.2]) base_plate();
    }
}


// holder with blank space at new position
difference() {
    low_profile_holder();
    translate([6.8, 13.3+4, 0]) cube([10.8, 45, 100]);
    translate([60, 13.3+4, 0]) cube([10.8, 12, 100]);
}

// fillup for red hole from moving two schrew holes
translate([6.8, 13.3, 0]) cube([10.8, 4, 3.3]);

// fillup for blue hole from moving two schrew holes
translate([60, 13.3, 0]) cube([10.8, 4, 3.3]);


translate([0, 4, 0])
intersection() {
    low_profile_holder();
    color("red", 1)
    translate([6.8, 13.3, 0]) cube([10.8, 45, 100]);
}

translate([0, 4, 0])
intersection() {
    low_profile_holder();
    color("blue", 1)
    translate([60, 13.3, 0]) cube([10.8, 12, 100]);
}
