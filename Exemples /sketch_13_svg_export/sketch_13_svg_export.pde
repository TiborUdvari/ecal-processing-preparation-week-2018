import processing.svg.*;

ArrayList<PVector> listPoints;

void setup() {
  size(320, 320);
  listPoints = new ArrayList<PVector>();
  listPoints.add(new PVector(-1 , 1));
  listPoints.add(new PVector(-1, -1));
  listPoints.add(new PVector( 1, -1 ));
  listPoints.add(new PVector( 1,  1));

  noFill();
  noLoop();
}

void draw(){
  
  beginRecord(SVG, "filename2.svg");
  drawElements();
  endRecord();
}

void drawElements(){
  int cols = 7;
  int rows = 7;
  float deltaX = width / (float)cols;
  float deltaY = height / (float) rows;
  
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      float x = deltaX / 2 + i * deltaX;
      float y = deltaY / 2 + j * deltaY;
      
      pushMatrix();
        translate(x, y);
        //float randomRotation = PI / 2 * floor(random(0,5));
        //rotate(randomRotation);
        drawShape(deltaX / 1.5);
      popMatrix();
    }
  } 
}

void drawShape(float s) {
  float d = s/2;
  /*
  line(-d, d, -d, -d);
  line(-d, -d, d, -d);
  line(d, -d, d, d); 
  */
  
  // Workaround because XY plotter does not like rotations
  int randomRotation = floor(random(0,5));
  
  beginShape();
  for (int i = 0; i < 4; i++){
    int idx = (randomRotation + i) % 4;
    PVector p = listPoints.get(idx);
    vertex(p.x * d, p.y * d);
  }
  endShape();
}