void setup() {
  size(500, 500);
  colorMode(HSB,width,height,100);
  for (int i = 0; i < 100; i++) {
    float x = random(500);
    float y = random(500);
    float z = random(100);
    circle(x, y, z);
  }
  saveFrame("demo.png");
}

void mouseClicked(){
  
}
