$fn=20;

breite = 32;
tiefe = 3;
hoehe = 80.5;

schiene = 2.5;
platinendicke = 1.2;


wanddicke = 1;
edge_radius = wanddicke;

platinentop_bis_top = 21;

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

schraube=3;

module schr() {
    translate([schraube/2, 20, schraube/2])
    rotate([90, 0, 0])
    cylinder(h=20, d=schraube);
}

module auflage() {
    // pcbauflage
    translate([0, 0, 0])
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
}

module pcb_holder() {
    translate([0, 0, -platinentop_bis_top]) // 21mm from top
    rotate([-90, 0, 0])
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
                    
                }
            }
            auflage();
        }
        translate([1, 0, 1]) schr();
        translate([breite-schraube-1, 0, 1]) schr();
        translate([1, 0, hoehe-schraube-1]) schr();
        translate([breite-schraube-1, 0, hoehe-schraube-1]) schr();
        
        cube([21, 3, 35]);
        translate([0, 0, 42]) cube([9, 3, 4]);
        translate([0, 0, 60]) cube([9, 3, 4]);
    }
}


pcb_holder();

// kabelzugentlastung input
translate([(breite-3)/2, -3, platinendicke-platinentop_bis_top-3]) cube([3, 3, 3]);
translate([(breite-2)/2, -20, platinendicke-platinentop_bis_top-2]) cube([2, 20, 2]);
translate([(breite-3)/2, -20, platinendicke-platinentop_bis_top-3]) cube([3, 2, 3]);

translate([0, hoehe+3, platinendicke-platinentop_bis_top-3])
rotate([45, 0, 0]) union() {
    translate([11-3/2, 0, 0]) cube([3, 25, 3]);
    translate([breite-11-3/2, 0, 0]) cube([3, 25, 3]);
    translate([0, 0, 0]) cube([3, 25, 3]);
    translate([breite-3, 0, 0]) cube([3, 25, 3]);
}

translate([11-3/2, hoehe, platinendicke-platinentop_bis_top-3]) cube([3, 3, 3]);
translate([breite-11-3/2, hoehe, platinendicke-platinentop_bis_top-3]) cube([3, 3, 3]);
translate([0, hoehe, platinendicke-platinentop_bis_top-3]) cube([3, 3, 3]);
translate([breite-3, hoehe, platinendicke-platinentop_bis_top-3]) cube([3, 3, 3]);

translate([0, hoehe+26-8, -12-3]) cube([breite, 8, 12+3]);
translate([0, hoehe+29-8, -12-3]) cube([10+5.4, 8, 12+3]);

translate([0, hoehe+26-8+3, -9.4]) cube([breite, 8, 9.4]);
translate([0, hoehe+29, -12]) cube([10+5.4, 12, 12]);

translate([10+5.4-1.3, hoehe+29-8, -12-3]) cube([1.3, 20, 12+3]);

// y-offset zu rückseite usb buchse: CAD 0-punkt ist bei 109.5mm
// schraubenloch ist bei 128.5 -> CAD bei y=-19mm z=-5.5

difference() {
    hull() {
        translate([-wanddicke, -4, -platinentop_bis_top-3.25]) cube([4, 4, 3.5]);
        translate([-wanddicke, -19, -5.5]) rotate([0, 90, 0]) cylinder(h=4, d=9);
    }
    union() {
        translate([-5, -19, -5.5]) rotate([0, 90, 0]) cylinder(h=10, d=3.2);
        translate([-wanddicke+2, -19, -5.5]) rotate([0, 90, 0]) cylinder(h=4, d=7.1);
    }
}




//cube([3, hoehe+29+12, 3]);
