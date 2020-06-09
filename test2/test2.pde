void setup(){
  size(500,500);
  colorMode(HSB,width,height,100);
}

void draw(){
  float blockSize = 50;
 for(float i = 0.0; i < width; i += blockSize){
   for(float j = 0.0 bb; j < height; j+= blockSize){
     square(i,j,blockSize);
     circle(i + blockSize / 2,j + blockSize / 2,blockSize * 0.9);
   }
 }
}
