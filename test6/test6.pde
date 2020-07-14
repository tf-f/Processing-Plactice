void setup(){
  size(500,500);
}

void draw(){
  
  float step = 10;
  float xOff = 0.0;
  float yOff = mouseY * 0.05;
  float zOff = mouseX * 0.05;
  float noiseScale = 0.03;
  
  for(float x = 0; x < width; x += step){
    xOff += noiseScale;
    yOff = 0.0;
    for(float y = 0; y < height; y += step){
      yOff += noiseScale;
      noStroke();
      fill(map(noise(xOff, yOff, zOff), 0, 1, 0, 255));
      square(x, y, step);
    }
  }
}
