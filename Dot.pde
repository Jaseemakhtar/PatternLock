class Dot{
float x;
float y;
float r;

  public Dot(float x_, float y_){
    x = x_;
    y = y_;
    r = 4;
  }
  
  public void show(){
    stroke(255);
    ellipse(x, y, r * 2, r * 2);
  }
  
}
