$fn=20;

//breite = 70;


breite = 60.3;
tiefe = 41;
hoehe = 21+3;

schiene = 2.5;
platinendicke = 1.8;


wanddicke = 1.4;
edge_radius = wanddicke;

module schienen() {
    cube([schiene, tiefe, schiene]);

    translate([breite-schiene, 0, 0])
    cube([schiene, tiefe, schiene]);

    translate([0, 0, schiene + platinendicke]) {
        cube([schiene, tiefe, schiene]);
        
        translate([breite-schiene, 0, 0])
        cube([schiene, tiefe, schiene]);
    }
}

/*
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
*/

module usbc_port() {
    platinenunterkante_bis_mitte_buchse = 7;
    from_bottom_insinde = schiene + platinenunterkante_bis_mitte_buchse - 6/2;
    usbc_port_width = 12;
    port_height = 7;
    color([1,1,0])
    translate([
        -wanddicke,
        port_height/2+5, //tiefe/2+6/2-usbc_port_width/2,
        port_height/2+from_bottom_insinde])
    rotate([90, 0, 90])
    hull() {
        translate([0, 0, 0])
          cylinder(h=wanddicke+schiene, d=port_height);
        translate([7, 0, 0])
          cylinder(h=wanddicke+schiene, d=port_height);
    }
}

// deckelauflage
translate([0, 0, 10+schiene])
linear_extrude(hoehe -10-schiene)
polygon(points=[[0,0], [0, 2.5], [2.5, 0]]);

translate([breite, 0, hoehe])
rotate([0, 180, 0])
linear_extrude(hoehe-5)
polygon(points=[[0,0], [0, 2.5], [2.5, 0]]);

translate([breite, 0, 0])
rotate([0, -90, 0])
linear_extrude(breite-25)
polygon(points=[[0,0], [0, 2.5], [2.5, 0]]);

translate([25, 0, hoehe])
rotate([0, 90, 0])
linear_extrude(breite-25)
polygon(points=[[0,0], [0, 2.5], [2.5, 0]]);


difference() {
    union() {
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
                //display();
                //output_terminals();

            }
        }
        schienen();
    }
    union() {
        usbc_port();
    }
}
     


//usbc_port();
