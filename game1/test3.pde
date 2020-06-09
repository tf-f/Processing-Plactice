float score = 0;
float scoreBuf = 1.0;
float dxdy = 2;
int countFrame = 999; // frame count
int createEnemyTimeRange = 50; //
float enemyRangeSize = 50; 
float biasEnemySize = 20;
float playerSize = 20;
int bonusPonit = 0;
float enemySize = 0.0;
float enemyPosX = 0.0;
float enemyPosY = 0.0;
float Timer = 0.0f;

void setup() {
  size(500, 500);
  background(0, 0, 0);
}

void draw() {
  countFrame++;
  //countTime--;
  background(0, 0, 0);
  fill(255,255,255);
  textSize(16);
  text("Score" + (int)(score * 10) / 10, 300, 30);
  
  
  if(countFrame > createEnemyTimeRange){
    background(0, 0, 0);
    fill(255, 0, 255);
    enemySize = random(enemyRangeSize) + biasEnemySize;
    enemyPosX = random(width);
    enemyPosY = random(height);    
    countFrame = 0;
    background(0, 0, 0);
  }
  
  fill(255, 0, 255);
  circle(enemyPosX, enemyPosY, enemySize);
  
  //Player
  fill(0, 255, 255);
  circle(mouseX, mouseY, playerSize);
  float judgeDistance = (enemySize/2.0 + playerSize/2.0 + dxdy) *(enemySize/2.0 + playerSize/2.0 + dxdy);
  float distanceX = (mouseX - enemyPosX)*(mouseX - enemyPosX);
  float distanceY = (mouseY - enemyPosY)*(mouseY - enemyPosY);
  if(  (distanceX + distanceY <= judgeDistance) && mousePressed){
    score += 100*scoreBuf*  ((enemySize - biasEnemySize)/10.0) + bonusPonit*10 + (50 - createEnemyTimeRange) * 30;
    countFrame = 999;
    if(createEnemyTimeRange-- < 10) createEnemyTimeRange = 10;
    bonusPonit++;
  }
}


void keyPressed() {
  if(key == 'c' || key == 'c'){
    background(0, 0, 0);
    score = 0;
    countFrame = 0;
    bonusPonit = 0;
    createEnemyTimeRange = 50;
  }
  if (key == 's' || key == 'S') {
    saveFrame("demo.png");
  }
  if(keyCode == UP){
    enemyRangeSize -=10;
    if(enemyRangeSize < 0){
      enemyRangeSize = 0;
    }else{
      scoreBuf /= 1.1;
    }
  }
  if(keyCode == DOWN){
    enemyRangeSize +=10;
    if(enemyRangeSize >80){
      enemyRangeSize = 0;
    }else{
      scoreBuf *= 0.9;
    }
    
  }
  if(keyCode == LEFT){
    createEnemyTimeRange++;
  }  
  if(keyCode == RIGHT){
    createEnemyTimeRange--;
  }
}
