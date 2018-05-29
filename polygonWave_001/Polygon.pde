class Polygon{
  PVector pos;
  float angle;
  float rad;
  int sides;
  float max;
  
  color myColor;
  
  Polygon(PVector nPos, float nAngle, float nRad, int nSides, float nMax){
    pos = nPos;
    angle = nAngle;
    rad = nRad;
    sides = nSides;
    myColor = palette[int(random(0,palette.length))];
    max = nMax;
  }
  
  void move(){
    pos.z = sin(radians(angle))*max;
    angle+=10;
  }
  
  void display(){
    float increment = 360/sides;
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    beginShape();
    stroke(myColor);
    for (int index = 0; index < 360; index+= increment){
      float x = sin(radians(index))*rad;
      float y = cos(radians(index))*rad;
      vertex(x,y);
    }
    endShape(CLOSE);
    popMatrix();
  }
}