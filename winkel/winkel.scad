$fn = 20;

breite = 77;
lochbreite = 65;
lochhoehe = 35;
dicke = 5;
aussenabstand = 3.5;
quertiefe = 25;

difference() {
    union() {
        color("blue", 1.0) {
            cube([breite, dicke, lochhoehe + dicke*1.5]);
        }

        color("green", 1.0) {
            cube([breite, quertiefe, dicke]);
        }
    }
    union() {
        translate([0, 0, lochhoehe]) {
            translate([dicke/2+aussenabstand, 0, dicke/2])
            rotate([90, 0, 0]) cylinder(20, d=dicke, center=true);

            translate([dicke/2+aussenabstand + lochbreite, 0, dicke/2])
            rotate([90, 0, 0]) cylinder(20, d=dicke, center=true);
        }

        translate([dicke/2+aussenabstand, (-1*dicke/2)-aussenabstand+quertiefe, 0])
        cylinder(20, d=dicke, center=true);

        translate([dicke/2+aussenabstand+lochbreite, (-1*dicke/2)-aussenabstand+quertiefe, 0])
        cylinder(20, d=dicke, center=true);
        
        translate([dicke/2+aussenabstand+lochbreite/2, (-1*dicke/2)-aussenabstand+quertiefe*0.7, 0])
        cylinder(20, d=dicke, center=true);
    }
}