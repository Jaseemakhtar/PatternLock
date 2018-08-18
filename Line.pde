class Line{
  float startX;
  float startY;
  float endX;
  float endY;
  
    public Line(float sX, float sY, float eX, float eY){
      startX = sX;
      startY = sY;
      endX = eX;
      endY = eY;
    }
    
    public void show(){
      strokeWeight(3);
      stroke(255);
      line(startX, startY, endX, endY);
    }
}
