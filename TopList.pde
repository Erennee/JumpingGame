class TopList{
  
  int firstLen=0;
  int secondLen=0;
  int thirdLen=0;
  
 class Node{
   String player;
   int score;
   Node same;
   Node next;
   
   public Node(String player,int score){
   this.player = player;
   this.score = score;
   same = null;
   next = null;
   }
   
 }
 
 Node first;
  
  public TopList(){
    first = null;
  }
  
  public boolean tryToAddScore(String player,int score){
    if(first == null){
      first = new Node(player,score);
      firstLen++;
    }else if(score > first.score){
      Node newFirst = new Node(player,score);
      if(first.next != null)first.next.next = null;
      newFirst.next = first;
      first = newFirst;
      thirdLen=secondLen;
      secondLen=firstLen;
      firstLen=1;
    }else if(score == first.score){
      first = addSameScore(first,new Node(player,score));
      firstLen++;
    }else if(first.next == null){
      first.next = new Node(player,score);
      secondLen++;
    }else if(score > first.next.score){
      Node newSecond = new Node(player,score);
      first.next.next = null;
      newSecond.next = first.next;
      first.next = newSecond;
      thirdLen=secondLen;
      secondLen=1;
    }else if(score == first.next.score){
      first.next = addSameScore(first.next,new Node(player,score));
      secondLen++;
    }else if(first.next.next == null){
      first.next.next = new Node(player,score);
      thirdLen++;
    }else if(score > first.next.next.score){
      Node newThird = new Node(player,score);
      first.next.next = newThird;
      thirdLen=1;
    }else if(score == first.next.next.score){
      first.next.next = addSameScore(first.next.next,new Node(player,score));
      thirdLen++;
    }else{
    return false;
    }
    
    return true;
  }
  
  Node addSameScore(Node pos,Node same){
     if(pos.same == null){
       pos.same = same;
     }else{
       pos.same = addSameScore(pos.same,same);
     }
     return pos;
  }
  
 public String[] getTextArray(){
   String[] scoreText = new String[firstLen+secondLen+thirdLen];
   int i=0;
   Node check = first;
   
   while(check != null){
     scoreText[i] ="#1 " + str(check.score) + "  -  " + check.player;
     check = check.same;
     i++;
   }
   
   check = first.next;
   
   while(check != null){
     scoreText[i] ="#2 " + str(check.score) + "  -  " + check.player;
     check = check.same;
     i++;
   }
   
   if(first.next != null){
     check = first.next.next;
     
     while(check != null){
       scoreText[i] ="#3 " + str(check.score) + "  -  " + check.player;
       check = check.same;
       i++;
     }
   }
   return scoreText;
 }
 public String getText(){
   String[] textArray = getTextArray();
   String text=textArray[0];
   for(int i=1;i<textArray.length;i++){
     text += "\n"+textArray[i];
   }
   return text;
 }
 
}
