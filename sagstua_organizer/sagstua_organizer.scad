tloustka_dreva = 5;
u_matrace = 10;
sirka_bocnice = 21;
uzitecna_sirka = 50;
vyska_bocnice = 141.5;
pod_bocnici = 0;
vyska = 150;
hloubka_dilu = u_matrace + sirka_bocnice + uzitecna_sirka + tloustka_dreva;
sirka_policky = 230;

module bocnice(){
   rost = 10;
   sirka_rostu = 100;
   dole = 25 - rost/2;
   translate([sirka_bocnice/2, sirka_bocnice/2, 0])circle(sirka_bocnice/2);
   translate([sirka_bocnice/2, vyska_bocnice-sirka_bocnice/2, 0])circle(sirka_bocnice/2);
   translate([0,sirka_bocnice/2,0])square([sirka_bocnice, vyska_bocnice-sirka_bocnice]);
   translate([-sirka_rostu/2,dole,0])square([sirka_rostu,rost],center=true);
}

module bocni_dil_2d(){
   difference() {
      square([hloubka_dilu, vyska]);
      translate([u_matrace, pod_bocnici,0])bocnice();
   }
}

module bocni_dil(){
    linear_extrude(height=tloustka_dreva){
        bocni_dil_2d();
    }
}


module policka(){
    bocni_dil();
    translate([0,-tloustka_dreva,0])
        cube([hloubka_dilu, tloustka_dreva, sirka_policky]);
    translate([hloubka_dilu - tloustka_dreva, 0, 0])
        cube([tloustka_dreva, vyska, sirka_policky]);
    translate([0, 0, sirka_policky-tloustka_dreva])
        bocni_dil();

}


rotate([0, 90, 0])policka();

