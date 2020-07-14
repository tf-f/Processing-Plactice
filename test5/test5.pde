void setup() {
  size(500, 500);
  noStroke();
  background(255, 255, 255);
}

void draw() {
  float x = random(width);
  float y = random(height);

  float r = random(100, 255);
  float g = random(100, 255);
  float b = random(100, 255);
  fill(r, g, b, 80);
  
  float centerX = width / 2;
  float centerY = height / 2;
  float e = width * 0.2;
  float gx = centerX + e * randomGaussian();
  float gy = centerY + e * randomGaussian();

  circle(gx,gy,10);
  
}
