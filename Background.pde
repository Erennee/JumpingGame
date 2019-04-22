class Background{
 float floorHeight;
 color bColor;
 color floorColor;
 Background(float floorHeight,color bColor,color floorColor){
  this.floorHeight = floorHeight; 
  this.bColor=bColor;
  this.floorColor = floorColor;
  
  
  
 }
 
 void display(){
   
   //sky
   background(bColor);
   
   //floor
   noStroke();
   fill(floorColor);
   rect(0,height-floorHeight,width,floorHeight);
 }
}
