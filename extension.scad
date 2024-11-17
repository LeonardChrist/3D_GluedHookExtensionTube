extensionInnerDiameter = 10;
extensionOuterDiameter = 14;
extensionLength = 80;
extensionCutoutLength = 30;

safetyPinDiameter = 4;
safetyPinLength = 7;

lockingGrooveWidth = 4;
lockingGrooveAngleOffset = 90;
lockingGrooveFinalSpotZOffset = 10;
lockingGrooveExtraLength = 2;
lockingGrooveFullLength = lockingGrooveFinalSpotZOffset + lockingGrooveExtraLength + lockingGrooveWidth / 2;



$fn = 64;




difference()
{
    // main tube
    cylinder(d = extensionOuterDiameter, extensionLength);

    // main tube inner cutout
    translate([0, 0, extensionLength - extensionCutoutLength + 0.01])
        cylinder(d = extensionInnerDiameter, extensionCutoutLength);

    // groove final position
    translate([0, 0, extensionLength - lockingGrooveFinalSpotZOffset])
        rotate([-90, 0, 0])
            cylinder(d = lockingGrooveWidth, extensionOuterDiameter);

    // groove length
    rotate([0, 0, lockingGrooveAngleOffset])
        translate([-lockingGrooveWidth / 2, 0, extensionLength - lockingGrooveFullLength])
            cube([lockingGrooveWidth, extensionOuterDiameter, lockingGrooveFullLength + 0.01]);

    // groove connector
    translate([lockingGrooveWidth / 2, 0, extensionLength - lockingGrooveFullLength])
        rotate([0, 0, 90])
            cube([extensionOuterDiameter, extensionOuterDiameter, lockingGrooveWidth]);
}

difference()
{
    // safety pin
    rotate([-90, 0, 0])
        cylinder(d = safetyPinDiameter, h = safetyPinLength + extensionOuterDiameter / 2);

    // cutting safety pin flat at the bottom
    translate([0, 0, -safetyPinDiameter / 2])
        cube([extensionOuterDiameter + safetyPinLength * 3, extensionOuterDiameter + safetyPinLength * 3, safetyPinDiameter], center = true);
}