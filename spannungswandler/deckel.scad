$fn=50;

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


cube([breite, edge_radius, hoehe]);




