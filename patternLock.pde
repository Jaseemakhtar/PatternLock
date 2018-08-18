ArrayList<Dot> dots;
ArrayList<Line> lines;
PVector p = new PVector();
int n = 3;
boolean validClick = false;
boolean dragging = false;
float validX, validY;

void setup(){
  size(620,400);
  int gapX = width / 4;
  int gapY = height / 4;
  int startX = gapX;
  int startY = gapY;
  
  dots = new ArrayList();
  lines = new ArrayList();
  
    for(int i = 0; i < n; i++){
      for(int j = 0; j < n; j++){
            Dot dot = new Dot(startX, startY);
            dots.add(dot);
            startX += gapX;
      }
      startX = gapX;
      startY += gapY;
    }
}

void draw(){
  background(0);
  noFill();
  for(Dot dot : dots){
    strokeWeight(1);
    dot.show();
  }
  if(dragging && validClick){
    strokeWeight(3);
    line(validX, validY, mouseX, mouseY);
    for(Dot dot: dots){
      if(mouseX >= dot.x - dot.r && mouseX <= dot.x + dot.r
          && mouseY >= dot.y - dot.r && mouseY <= dot.y + dot.r){    
        //println("Clicked another dot");
        Line line = new Line(validX, validY, dot.x, dot.y);
        lines.add(line);
        validX = dot.x;
        validY = dot.y;
      }
    }
  }
  
  for(Line line: lines){
    line.show();
  }
}

void mouseDragged(){
  dragging = true;
}

void mouseReleased(){
  dragging = false;
  validClick = false;
}

void mousePressed(){
  for(Dot dot: dots){
    if(mouseX >= dot.x - dot.r && mouseX <= dot.x + dot.r
        && mouseY >= dot.y - dot.r && mouseY <= dot.y + dot.r){
      println("Clicked on " + dots.indexOf(dot) + " : " + dot.x + ", " + dot.y);
      validClick = true;
      validX = dot.x;
      validY = dot.y;
    }
  }
}
