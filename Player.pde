class Player{
  float x;
  float y;
  float w;
  float h;
  
  color c;
  
  BoxCollision collision;
 
  Player(float x,float y,float w,float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    c = color(#FFFFFF);
    
    collision = new BoxCollision(x,y,w,h);
  }
  
  Player(float x,float y,float w,float h,color c){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    this.c = c;
    
    collision = new BoxCollision(x,y,w,h);
  }
  
  void display(){
    noStroke();
    fill(c);
    rect(x,y,w,h);
    collision.check(x,y,w,h);
  }
  
  
}
