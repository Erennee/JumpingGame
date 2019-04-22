class Enemy{
  
  float x;
  float y;
  float w;
  float h;
  
  BoxCollision collision;
  
  color c;
  
  Enemy(float x,float y,float w,float h){
  this.x = x;
  this.y = y;
  this.w = w;
  this.h = h;
  c = color(#FFFFFF);
  collision = new BoxCollision(x,y,w,h);
  }
  
  Enemy(float x,float y,float w,float h,color c){
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
    rect(x,y,w,h,2);
    collision.check(x,y,w,h);
  }
  
   
  
}
