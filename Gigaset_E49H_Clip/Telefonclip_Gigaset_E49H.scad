/*

Gigaset E49H DECT Telephone Handset Belt Clip Replacement

By Dominik Heidler <dominik@heidler.eu>

License: GPLv3

*/

ring_outer = 26;
ring_inner = 20;
ring_height = 3.5;

snap_width = (ring_outer - ring_inner - 2) / 2;
snap_height = 1.5;
snap_size = 20; //degree

clip_height = 3;

fn = 300;

module snap(inner_offset=0) {
    rotate_extrude2(angle=snap_size, $fn=fn) {
        translate([(ring_inner + 2 + inner_offset)/2, ring_height/2, 0])
        polygon([
            [0,0],
            [0.5,0],
            [0.5,snap_height-0.5],
            [snap_width,snap_height-0.5],
            [snap_width,snap_height],
            [0,snap_height]
        ], paths=[[0,1,2,3,4,5]]);
    }

    rotate_extrude2(angle=3, $fn=fn) {
        translate([(ring_inner + 2 + inner_offset)/2, ring_height/2, 0])
        square([snap_width, snap_height]);
    }
}

module ring_lock() {
    translate([(ring_inner + 2)/2, 0, ring_height/2]) {
        translate([-0.5, 0, 0]) cube([1.5,1,1]);
        // wherever this translate values come from...
        rotate(180) translate([-1, -2, 0]) prism(1.5,1,1);
    }
}


module clip_ring() {
    difference() {
     cylinder(ring_height, ring_outer/2, ring_outer/2, true, $fn=fn);
     cylinder(ring_height, ring_inner/2, ring_inner/2, true, $fn=fn);
    }
}

// clip ring
translate([0, 0, ring_height/2]) {
    clip_ring();
    rotate(-308) snap();
    rotate(-45) snap();
    rotate(-(180+(snap_size/2))) snap(-1);
    rotate(-274) ring_lock();
}


// actual clip
translate([-1.5*ring_outer, -0.5*ring_outer, -clip_height])
cube([ring_outer*1.5, ring_outer, clip_height]);

translate([0, 0, -clip_height/2])
cylinder(3, ring_outer/2, ring_outer/2, true, $fn=fn);






module rotate_extrude2(angle=360, convexity=2, size=1000) {

  module angle_cut(angle=90,size=1000) {
    x = size*cos(angle/2);
    y = size*sin(angle/2);
    translate([0,0,-size]) 
      linear_extrude(2*size) polygon([[0,0],[x,y],[x,size],[-size,size],[-size,-size],[x,-size],[x,-y]]);
  }

  // support for angle parameter in rotate_extrude was added after release 2015.03 
  // Thingiverse customizer is still on 2015.03
  angleSupport = (version_num() > 20150399) ? true : false; // Next openscad releases after 2015.03.xx will have support angle parameter
  // Using angle parameter when possible provides huge speed boost, avoids a difference operation

  if (angleSupport) {
    rotate_extrude(angle=angle,convexity=convexity)
      children();
  } else {
    rotate([0,0,angle/2]) difference() {
      rotate_extrude(convexity=convexity) children();
      angle_cut(angle, size);
    }
  }
}


module prism(l, w, h){
   polyhedron(
           points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
           faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
           );
}
