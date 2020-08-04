float score = 0,scoreBuf;
int miss,good,combo,maxCombo;
float dxdy, vx, vy;
int countFrame = 99999; 
/*const*/ int defCreateEnemyTimeRange = 100;
int createEnemyTimeRange;
float enemyRangeSize,biasEnemySize;
float playerSize,enemySize,enemyPosX,enemyPosY,Timer;
boolean playing = false;
//Timer
/*const*/ int timeLimit = 30;
int stms,ts;

void setup() {
  size(500, 500);
  background(0, 0, 0);
  init();
}

void draw() {
  background(0, 0, 0);
  fill(255,255,255);
  
  if(playing){
    //Timer
    ts = timeLimit - (millis() - stms)/1000;
    if(ts < 1) playing = false;
    
    textSize(16);
    text("Score " + (int)(score * 10) / 10, 300, 30);
    text("Combo " + combo , 200, 30);
    text("Good " + good , 200, 50);
    text("Timer: " + ts , 100,30);
  
    if(countFrame > createEnemyTimeRange){
      if(countFrame < 99999){
        combo = 0;
        miss++;
        if(createEnemyTimeRange < defCreateEnemyTimeRange) createEnemyTimeRange += 3;
      }
      background(0, 0, 0);
      fill(255, 0, 255);
      enemySize = random(enemyRangeSize) + biasEnemySize;
      enemyPosX = random(width - 40)+ 20;
      enemyPosY = random(height - 60) + 40; 
      vx = (random(20) - 10) / 10.0;
      vy = (random(20) - 10) / 10.0;
      countFrame = 0;
      background(0, 0, 0);
    }else{
      enemyPosX += vx * combo;
      enemyPosY += vy * combo;
      if(enemyPosX > width || enemyPosX < 0) vx *= -1.0 ;
      if(enemyPosY> height || enemyPosY < 0) vy *= -1.0;
    }
    
    countFrame++;
    fill(255, 0, 255);
    circle(enemyPosX, enemyPosY, enemySize);
    
    //Player
    fill(0, 255, 255);
    circle(mouseX, mouseY, playerSize);
    
    float judgeDistance = (enemySize/2.0 + playerSize/2.0 + dxdy) *(enemySize/2.0 + playerSize/2.0 + dxdy);
    float distanceX = (mouseX - enemyPosX)*(mouseX - enemyPosX);
    float distanceY = (mouseY - enemyPosY)*(mouseY - enemyPosY);
    if(mousePressed){
      if(distanceX + distanceY <= judgeDistance){
        //Score
        score += scoreBuf * 100 * ((enemySize - biasEnemySize)/10.0) + pow(2,combo) + (defCreateEnemyTimeRange - createEnemyTimeRange) * 300;
        countFrame = 99999;
        if(createEnemyTimeRange-- < 10) createEnemyTimeRange = 10; //speed up
        maxCombo = max(maxCombo,++combo);  
        good++;
      }
    } 
  }else{
    //Result
    textSize(24);
   text("Result:  ", 170, 100);
   text("Score:  " + (int)(score+0.5), 170, 150);
   text("Max Combo:  " + maxCombo , 170,200);
   text("Good:  " + good , 170 ,250);
   text("Miss:  " + miss , 170 ,300);
  } 
}
 
void init(){
  createEnemyTimeRange = defCreateEnemyTimeRange;
  playing = true;
  stms = millis();
  score = 0;
  scoreBuf = 1.0;
  dxdy = 2;
  vx = 0;
  vy= 0;
  enemyRangeSize = 50; 
  biasEnemySize = 20;
  playerSize = 20;
  enemySize = 0.0;
  enemyPosX = 0.0;
  enemyPosY = 0.0;
  Timer = 0.0f;
  miss = 0;
  good = 0;
  combo = 0;
  maxCombo = 0; 
}

void keyPressed() {
  if(key == 'c' || key == 'C'){
    background(0, 0, 0);
    score = 0;
    countFrame = 0;
    maxCombo = 0;
    combo = 0;
    createEnemyTimeRange = defCreateEnemyTimeRange;
  }
  if (key == 's' || key == 'S') {
    saveFrame("demo.png");
  }
  if(keyCode == UP){
    enemyRangeSize -=10;
    if(enemyRangeSize < 0){
      enemyRangeSize = 0;
    }else{
      scoreBuf /= 0.9;
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
  if(keyCode== 'b' || keyCode == 'B'){
    playing = false;
  }
}
