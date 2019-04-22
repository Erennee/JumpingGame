Background background;

float tic=0;
float lastTime = 0;
float startDiffculuty=1;
float diffculutySize=0.3;
int diffculutyCount=0;
int everyDiffculutyIncreaseScore=5;
int lastDiffculutyChangedScore = 0;
boolean diffculutyChanged = false;
float diffculuty=startDiffculuty;
float gravity = 9.8*50*diffculuty;
float speed = 100*diffculuty;

Player player;

float playerX=50;
float playerStartPosY;
float playerScale=30;

boolean isJumping = false;

float jumpHeight=100;
float jumpDifference=30;
float jumpTimer;

float maxHeightTime = sqrt(2f*jumpHeight / gravity);
float firstVelocity = gravity * maxHeightTime;

ArrayList<Enemy> eList = new ArrayList<Enemy>();

float enemyMaxHeightDifference=30;
float enemyMinCooldown = 3/diffculuty;
float enemyMaxCooldown= 10/diffculuty;
float enemyTimer = 0;

float score=0;
Text scoreText;
Text restartText;

boolean stopGame=false;

void setup(){
  size(800,300);
  
  background=new Background(50*height/300,#67A7FF,#E8EAED);
  
  scoreText = new Text(width/2,(height-background.floorHeight)/3,25,0);
  restartText = new Text(width/2,(height-background.floorHeight)/3+30,25,0);
  playerStartPosY = height-background.floorHeight/2-playerScale;
  player = new Player(playerX*(width/800),playerStartPosY*(height/300),playerScale*(width/800),playerScale*(height/300),#E5DF15);
}

void draw(){
 background.display();
  
  if(enemyTimer<=0){
    createEnemy();
    enemyTimer = random(enemyMinCooldown,enemyMaxCooldown);
  }
  moveEnemies();
  
  player.display();
  scoreText.display(str((int)score));
  if(isJumping){
    jumpTimer += tic;
    jump(jumpTimer);
  }
  
  checkCollisions();
  score += tic*speed/500f;
  enemyTimer -= tic;
  
  if(((int)score)%everyDiffculutyIncreaseScore == 0 && lastDiffculutyChangedScore < (int)score){
    diffculutyCount++;
    everyDiffculutyIncreaseScore +=  (int)(diffculutySize*10);
    lastDiffculutyChangedScore = (int)score+everyDiffculutyIncreaseScore-1;
    diffculutyChanged = true;
  }
  
  if(!isJumping && diffculutyChanged){
    changeDiffculuty();
  }
  
  if(!stopGame)tic = timeDifference();
  else {
    restartText.display("Game over");
    tic = 0;
    lastTime = millis();
  }
}

void mousePressed(){
  if(mouseButton == RIGHT){
  stopGame = false;
  restartGame();
  }
  if(mouseButton == LEFT)
  if(!isJumping){
   isJumping = true;
   jumpTimer = 0;
  }
}

void restartGame(){
  diffculutyCount = 0;
  everyDiffculutyIncreaseScore=5;
  changeDiffculuty();
  score = 0;
   for(int i = eList.size()-1;i>=0;i--){
     eList.remove(i);
   }
   isJumping = false;
   player.y = playerStartPosY;
   background.bColor = color(#67A7FF);
   enemyTimer = 0;
}

void changeDiffculuty(){
  diffculuty = startDiffculuty + diffculutySize*diffculutyCount;  
  speed = 100*diffculuty;
  enemyMinCooldown = 2/diffculuty;
  enemyMaxCooldown= 5/diffculuty;
  gravity = 9.8*20*diffculuty;
  maxHeightTime = sqrt(2f*jumpHeight / gravity);
  firstVelocity = gravity * maxHeightTime;
  diffculutyChanged = false;
  println(diffculuty , everyDiffculutyIncreaseScore);
}

void jump(float t){
  float y;
  
  y = -gravity*t*t/2+firstVelocity*t;
  player.y = playerStartPosY - y;
  if(player.y >= playerStartPosY){
    isJumping = false;
  }
}

void createEnemy(){
  float maxHeight = jumpHeight-jumpDifference;
  Point enemySpawnPoint;
  Point enemySize;
  
  enemySize = new Point(25*(width/800),random(maxHeight - enemyMaxHeightDifference,maxHeight)*(height/300));
  enemySpawnPoint = new Point(width,height-background.floorHeight/2-enemySize.y);
  
 Enemy e = new Enemy(enemySpawnPoint.x,enemySpawnPoint.y,enemySize.x,enemySize.y);
 e.c = color(#5F4C4D);
 
 eList.add(e);
}

void moveEnemies(){
  for(int i=0;i<eList.size();i++){
    eList.get(i).x -= speed*tic*(width/800);
    Enemy e = eList.get(i);
    e.display();
    if(e.x + e.w < 0)
      eList.remove(i--);
  }
  
}

void checkCollisions(){
    int tCount=0;
    for(int j=0;j<eList.size();j++){
       if(player.collision.isTriggeredBy(eList.get(j).collision)){
         tCount++;
       }
    }
    if(tCount>0){
      stopGame = true;
      background.bColor = color(#F50545);
    }
}



float timeDifference(){
  float currentTime = millis();
  float difference;
  difference = (currentTime - lastTime) / 1000;
  lastTime = currentTime;
  return difference;
}
