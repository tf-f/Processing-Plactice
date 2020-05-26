color from = color(124, 0, 190);
color to = color(254, 153, 56);

void setup() {
  size(500, 500);
}

void draw() {
  noStroke();
  //colorMode(HSB, width, height, 100);
  float step = 1.0;

  for (float i = 0.0; i < height; i += step) {
    for (float j = 0.0; j < width; j += step) {
      //diff
      // color inter = lerpColor(from, to, min(i/(float)height, j/(float)height);
      color inter = lerpColor(from, to, (i + j)/(float)height / 2.0);
      fill(inter);
      
      rect(j, i, step, step);
    }
  }
}
