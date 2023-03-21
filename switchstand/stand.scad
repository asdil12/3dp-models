swh = 25.4; // switch height
wlt = 4; // wall thickness
ftl = swh; // foot len
plug_height = 10;
nubsi_height = wlt + plug_height;
nubsi_width = 4;
tray_wall_height = nubsi_height + 20;

linear_extrude(height=10)
polygon(points=[
[0,0],
[0,wlt],
[ftl,wlt],
[ftl,tray_wall_height],
[ftl+wlt,tray_wall_height],
[ftl+wlt,nubsi_height],
[ftl+wlt+nubsi_width,nubsi_height],
[ftl+wlt+nubsi_width,wlt],
[ftl+wlt+swh-nubsi_width,wlt],
[ftl+wlt+swh-nubsi_width,wlt],
[ftl+wlt+swh-nubsi_width,nubsi_height],
[ftl+wlt+swh,nubsi_height],
[ftl+wlt+swh,tray_wall_height],
[ftl+wlt+swh+wlt,tray_wall_height],
[ftl+wlt+swh+wlt,0],
]);