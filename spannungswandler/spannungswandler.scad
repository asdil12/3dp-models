$fn=20;

breite_display = 71.5;
tiefe_display = 39;

//breite = 70;


terminal_radius = 2;
terminal_box_breite = 30;
abstand = terminal_box_breite/3;

breite = breite_display + terminal_box_breite + abstand;
tiefe = tiefe_display + 2*abstand;
hoehe = 40;


wanddicke = 2;
edge_radius = wanddicke;


// display
module display() {
    color([1,0,0])
    translate([terminal_box_breite,0,0])
    translate([0,//(breite-terminal_box_breite-breite_display)/2, 
               (tiefe - tiefe_display)/2,
               hoehe])
    cube([breite_display, tiefe_display, wanddicke]);
}


// output terminals
module output_terminals() {
    translate([-4, 0, 0]) // display rand überstand breite
    color([0,0,1]) {
        translate([terminal_box_breite/2,
                   1*tiefe/4,
                   hoehe])
        cylinder(r=terminal_radius, wanddicke);

        translate([terminal_box_breite/2,
                   3*tiefe/4,
                   hoehe])
        cylinder(r=terminal_radius, wanddicke);
    };
}

difference() {
    hull() {
        sphere(r=edge_radius);
        translate([breite, 0, 0]) sphere(r=edge_radius);
        translate([breite, tiefe, 0]) sphere(r=edge_radius);
        translate([0, tiefe, 0]) sphere(r=edge_radius);
        translate([0, 0, hoehe]) {
            sphere(r=edge_radius);
            translate([breite, 0, 0]) sphere(r=edge_radius);
            translate([breite, tiefe, 0]) sphere(r=edge_radius);
            translate([0, tiefe, 0]) sphere(r=edge_radius);
        }
    }
    union() {
        translate([0, -10, 0]) cube([breite, tiefe+10, hoehe]);
        display();
        output_terminals();
    }
}
    



