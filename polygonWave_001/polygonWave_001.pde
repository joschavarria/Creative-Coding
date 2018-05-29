ArrayList<Polygon> polygonList;
color[] palette = {#4C0D5D,#4C0D5D, #1374A5,#184D81,#1797C6,#1A9ECF,#481264,#4C0D5D,#132341,#317ABF,#290F3C,#131D38,#111A32,#191E42,#5343B1,#3D3D95,#5680D8};

void setup(){
  size(800, 800, P3D);
  background(0);
  polygonList = new ArrayList<Polygon>();
  createCone();
    
  noFill();
  stroke(255);
  strokeWeight(4);
}

void createCone(){
  int numPolygons = 40;
  float rad = 300;
  float step = rad/numPolygons;
  
  float angle = 0;
  float increment = 360/numPolygons;
  
  for(int index = 0; index < numPolygons; index++){
    PVector pos = new PVector(0,0,0);
    Polygon newPoly = new Polygon(pos, angle, rad, 6, 3*index);
    polygonList.add(newPoly);
    
    rad-= step;
    angle += increment;
  }
}

void draw(){
  background(0);
  
  translate(width/2, height/2);
  rotateX(radians(30));
  rotateY(radians(30));
  for (Polygon thisPoly : polygonList){
    thisPoly.move();
    thisPoly.display();
  }
}