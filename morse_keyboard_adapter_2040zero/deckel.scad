$fn=50;


breite = 18;
tiefe = 41;
hoehe = 10;


wanddicke = 1;
edge_radius = wanddicke;

difference() {
    cube([breite, edge_radius, hoehe]);
    hull() {
        translate([4.2+4/2, 0, 3+4/2])
        rotate([90, 0, 0]) cylinder(h=wanddicke*2, d=4, center=true);
        translate([18-4.2-4/2, 0, 3+4/2])
        rotate([90, 0, 0]) cylinder(h=wanddicke*2, d=4, center=true);
    }
}




