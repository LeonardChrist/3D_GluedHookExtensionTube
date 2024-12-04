$fn = 64;


baseSideLength = 20;
baseHeight = 2;

rodDiameter = 7;
rodLength = 25;

pinDiameter = 5;
pinHeight = 6;
pinOffset = 20;

translate([0, 0, baseHeight / 2])
    cube([baseSideLength, baseSideLength, baseHeight], center = true);

translate([0, 0, baseHeight])
    cylinder(d = rodDiameter, h = rodLength);

translate([0, 0, baseHeight + pinDiameter / 2 + pinOffset])
    rotate([90, 0, 0])
        cylinder(d = pinDiameter, h = pinHeight + rodDiameter / 2);