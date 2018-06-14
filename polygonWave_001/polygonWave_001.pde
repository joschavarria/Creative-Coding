/*
PolygonWave_001
Coded by Jose Chavarría
Feel free to use the code, please just keep the credits.
If you have any doub please contact me to chavarria.sancho.jose@gmail.com

Last update: 16/06/2018
*/

ArrayList<Polygon> polygonList; //Define a list that contains all the polygons of the cone
color[] palette = {#4C0D5D,#4C0D5D, #1374A5,#184D81,#1797C6,#1A9ECF,#481264,#4C0D5D,#132341,#317ABF,#290F3C,#131D38,#111A32,#191E42,#5343B1,#3D3D95,#5680D8}; //Defines the color pallette that will be used

void setup(){
  size(800, 800, P3D);
  background(0);
  polygonList = new ArrayList<Polygon>(); //Creates the list
  createCone(); //Calls the function that creates every polygon
    
  noFill();
  stroke(255);
  strokeWeight(4);
}

void createCone(){
  int numPolygons = 40; //Number of polygons that it's gonna be created
  float rad = 300; //Radius of the whole cone, it means, that the radius of the biggest polygon
  float step = rad/numPolygons; //Space between every polygon acording to the max. radius and the number of polygons
  
  float angle = 0; //This angle is going to define the position in the Z axis of the polygon, by calculating this one with a sinus function.
  float increment = 360/numPolygons; //It defines the angle/space between  every polygon on the sinus function
  
  //In this for loop we're going to create every polygon
  for(int index = 0; index < numPolygons; index++){
    PVector pos = new PVector(0,0,0); //It defines the center of the polygon as a vector, which is the same for every polygon in order to make them concentric
    Polygon newPoly = new Polygon(pos, angle, rad, 6, 3*index); //Creates the polygon using: Position, Angle, Number of sides, Max/Limit of Z movement
    polygonList.add(newPoly); //The polygon is added to the list
    
    rad-= step; //The radius is reduced so the next one is going to be smaller that this one
    angle += increment; //The angle is incremented so the position in Z is going to be the next one in the sinus function.
  }
}

void draw(){
  background(0);
  
  translate(width/2, height/2); //The reference point of the composition is translated to the middle of the canvas
  rotateX(radians(30)); //We give some rotation in the X and Y axis to see some 3D effect
  rotateY(radians(30));
  
  //In this for loop we go thru the whole list to check every element
  for (Polygon thisPoly : polygonList){
    thisPoly.move(); //We call the function of movement.
    thisPoly.display(); //We display the polygon
  }
}
