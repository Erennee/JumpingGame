class Text{
  float x;
  float y;
  
  float size;
  color c;
  
    Text(float x,float y,float size,color c){
       this.x = x;
       this.y = y;
       this.size = size;
       this.c = c;
    }
    
    void display(String text){
      textSize(size);
      textAlign(CENTER,CENTER);
      fill(c); 
      text(text,x,y);
    }
}
