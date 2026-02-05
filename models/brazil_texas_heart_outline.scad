// OpenSCAD script to create a layered heart from Brazil and Texas outlines.  
//  
// Follow these steps to download the SVG files:  
// 1. Go to the respective website that hosts the SVG outlines for Brazil and Texas.
// 2. Download the SVG files and save them in the same directory as this script.
//  
// To convert SVG to OpenSCAD:  
// - Use a tool like Inkscape to ensure the paths are clean and suitable for OpenSCAD.
//  
// To export your final model to STL or 3MF:  
// - In OpenSCAD, go to File > Export > Export as STL/3MF.  
//  

// Parameters  
$brazilSVG = "path/to/brazil.svg";  
$texasSVG = "path/to/texas.svg";  
$heartWidth = 125; // Width of heart in mm  
$scaleFactor = 500 / 1000; // Scale to mm  

module overlay_shape() {  
    // Import and scale Brazil outline  
    brazil = import($brazilSVG);  
    scale($scaleFactor) {  
        center();  
        difference() {  
            offset(r=2) import(brazil);  
            linear_extrude(height = 4) polygon(points=brazil);  
        }  
    }  
    // Import and scale Texas outline  
    texas = import($texasSVG);  
    scale($scaleFactor) {  
        center();  
        difference() {  
            offset(r=2) import(texas);  
            linear_extrude(height = 4) polygon(points=texas);  
        }  
    }  
}  

module heart() {  
    translate([0, 0, 0])  
        linear_extrude(height=4)  
        offset(delta=2)    
        polygon(points=heart_shape());  
}  

// Invoke the functions  
overlay_shape();  
heart();  
