// A Base for Solar Lights what my wife bought from Large SuperMarket
// By Zilizii
// Idea from : http://www.thingiverse.com/thing:78398
// this shall be printed upside down...


//Diameter of the male part
D=28;	
	
//Height of the male part, most pieces are around D=H 
H=2; 		

//Height of the base in mm
H2 = 15; 			

//Diameter of the base in mm - measured and adjusted based on many measurements
D2 = 57.5; 			

//How much the ribs/male part come past the given diameter D
tolerance = 0.9;	

//How far the ribs come out from the first diameter
delta=0.5;		

//Bore diameter 1/4"=6.35 mm for landscaping stake
B=24; 			

Resolution = 60; //internal variable for resolution of rendering
$fn=Resolution; 

number_of_ribs = 6;

rib_thickness = 2;

difference(){ 	//remove the bore from...
	union() {		//add the male part, base and ribs
		cylinder(h=H2, r=D2/2);		 //base
		ribs(number_of_ribs);        //ribs, defined below
        translate([0,0,H2]) cylinder(h=H, r=(D2+tolerance*4+delta)/2);	
		}
        cylinder(h=H+H2, r=(B+tolerance-delta)/2); // add extra base to not too fall in the tube
	}

module ribs(n){ //creates n ribs spaced axially around the bore, extending tolerance beyond D/2
	R=D2/2+tolerance;
	thickness = rib_thickness;
	if (n > 0){	//if you dont put this in, and call ribs(0)
		for ( i = [0 : 5] ){
    			rotate( i * 360 / n, [0, 0, 1])
    			translate([-R, -thickness/2, 0]) 
			cube([R, thickness, H2]);
			}
	}
}




			