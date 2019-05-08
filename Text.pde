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
    
    void display(String text,int align){
      textSize(size);
      if(align == 0)
      textAlign(CENTER,CENTER);
      if(align == 1)
      textAlign(RIGHT,TOP);
      fill(c); 
      text(text,x,y);
    }
}
