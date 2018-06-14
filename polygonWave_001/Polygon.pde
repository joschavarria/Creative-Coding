class Polygon{

  //We define some characteristics for the whole Polygon
  PVector pos;
  float angle;
  float rad;
  int sides;
  float max; //This is the maximun displacement in the Z axis that the polygon can have
  
  color myColor;
  
  Polygon(PVector nPos, float nAngle, float nRad, int nSides, float nMax){
    pos = nPos;
    angle = nAngle;
    rad = nRad;
    sides = nSides;
    myColor = palette[int(random(0,palette.length))]; //Chooses a random color from the color palette
    max = nMax;
  }
  
  void move(){
    pos.z = sin(radians(angle))*max; //It calculates the position in Z by calculating the sinus poistion (from -1 to +1) and multiplying it by the mex. displacement
    angle+=10; //It increases the angle so the next time it runs it's going to have a different position and makes the animation, the smaller the increase number is, the slower it moves
  }
  
  void display(){
    float increment = 360/sides; //It defines the angle increment for every point of the polygon, in order to mke a polygon
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    beginShape();
    stroke(myColor);
    
    //This for loop calculates every vertex of the polygon by going thru the angles
    for (int index = 0; index < 360; index+= increment){
      float x = sin(radians(index))*rad; //Calculates the position of the vertex in X by using a sinus function
      float y = cos(radians(index))*rad; //Calculates the position of the vertex in Y by using a cosinus function
      vertex(x,y); //Draw the vertex
    }
    endShape(CLOSE); //Close the shape
    popMatrix();
  }
}
