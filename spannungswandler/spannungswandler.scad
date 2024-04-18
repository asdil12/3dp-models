$fn=20;

breite_display = 72;
tiefe_display = 39.6;

//breite = 70;


terminal_durchmesser = 3.6;
// aussenumriss
//terminal_durchmesser = 11.7;
terminal_box_breite = 30;
abstand = terminal_box_breite/4.5;

breite = breite_display + terminal_box_breite + abstand;
tiefe = tiefe_display + 2*abstand;
hoehe = 40;


wanddicke = 2;
edge_radius = wanddicke;


// display
module display() {
    color([1,0,0])
    translate([terminal_box_breite, 
               (tiefe - tiefe_display)/2,
               hoehe])
    cube([breite_display, tiefe_display, wanddicke]);
    // nubsis
    tiefe_nubsi = 13;
    translate([terminal_box_breite-1.5, 
               (tiefe - tiefe_nubsi)/2,
               hoehe])
    cube([breite_display+3, tiefe_nubsi, wanddicke]);
}


// output terminals
module output_terminals() {
    translate([-4, 0, 0]) // display rand überstand breite
    color([0,0,1]) {
        translate([terminal_box_breite/2,
                   1*tiefe/4,
                   hoehe])
        cylinder(d=terminal_durchmesser, wanddicke);

        translate([terminal_box_breite/2,
                   3*tiefe/4,
                   hoehe])
        cylinder(d=terminal_durchmesser, wanddicke);
    };
}

module usbc_port() {
    usbc_requester_pcb_thickness = 0.9;
    usbc_port_width = 10;
    color([1,1,0])
    translate([
        breite/2+3.4/2-usbc_port_width/2,
        tiefe+edge_radius,
        usbc_requester_pcb_thickness+3.4/2])
    rotate([90, 0, 0])
    hull() {
        translate([0, 0, 0])
          cylinder(h=edge_radius, d=3.4);
        translate([usbc_port_width-3.4, 0, 0])
          cylinder(h=edge_radius, d=3.4);
    }
}

//translate([-50, 0, 0])
linear_extrude(hoehe)
polygon(points=[[0,0], [0, 2.5], [2.5, 0]]);

translate([breite, 0, hoehe])
rotate([0, 180, 0])
linear_extrude(hoehe)
polygon(points=[[0,0], [0, 2.5], [2.5, 0]]);

translate([breite, 0, 0])
rotate([0, -90, 0])
linear_extrude(breite)
polygon(points=[[0,0], [0, 2.5], [2.5, 0]]);

translate([0, 0, hoehe])
rotate([0, 90, 0])
linear_extrude(breite)
polygon(points=[[0,0], [0, 2.5], [2.5, 0]]);

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
        translate([0, 0-10, 0]) cube([breite, tiefe+10, hoehe]);
        display();
        output_terminals();
        usbc_port();
    }
}
    



