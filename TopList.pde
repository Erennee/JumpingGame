class TopList{
  int len = 0;
  int size = 0;
  
  int minLen;
  int maxLen;
  
  int scoreFlowLimit;
  
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
  
  public TopList(int minLen,int maxLen,int scoreFlowLimit){
    this.minLen = minLen;
    this.maxLen = maxLen;
    this.scoreFlowLimit = scoreFlowLimit;
    first = null;
  }
  
  public void tryToAddScore(String player,int score){
    
    first = AddScore(first,player,score,0);
    
    if(len>minLen){
      Node limited = getNode(first,minLen);
      int minScore = limited.score-scoreFlowLimit;
      limited = limitTopLen(limited,minLen,minScore);
      first = setNode(first,minLen,limited);
    }
    
    len = 0;
    size = 0;
    
    checkLen(first);
    checkSize(first);
     
  }
  
  Node AddScore(Node curr,String player,int score,int len){
    if(curr == null){
     curr = new Node(player,score);
     return curr;
    }
    if(curr.score < score){
      Node newCurr = new Node(player,score);
      newCurr.next = curr;
      return newCurr;
    }else if(curr.score == score){
      curr = addSameScore(curr,new Node(player,score));
      return curr;
    }else{
      curr.next = AddScore(curr.next,player,score,len+1);
      return curr;
    }
  }
  
  Node addSameScore(Node pos,Node same){
     if(pos.same == null){
       pos.same = same;
     }else{
       pos.same = addSameScore(pos.same,same);
     }
     return pos;
  }
  
  Node limitTopLen(Node curr,int len,int minScore){
        if(len<maxLen && curr.score>=minScore){
          curr.next = limitTopLen(curr.next,len+1,minScore);
          return curr;
        }
        return null;
  }
  
  Node getNode(Node curr,int pos){
    if(pos>0){
     return  getNode(curr.next,pos-1);
    }
    return curr;
  }
  
  Node setNode(Node curr,int pos,Node newOne){
      if(pos>0){
         curr.next = setNode(curr.next,pos-1,newOne);
         return curr;
      }else{
        
       return newOne; 
      }
  }
  
  void checkSize(Node curr){
     if(curr != null){
        size++;
        checkSize(curr.same);
        checkSize(curr.next);
     }
  }
  
  void checkLen(Node curr){
     if(curr != null){
        len++;
        checkLen(curr.next);
     }
  }
  
 public String[] getTextArray(){
   String[] scoreText = new String[size];
   int i=0;
   Node check = first;
   Node pos = first;
   int p = 1;
   while(pos != null){
     scoreText[i] ="#"+p+" " + str(check.score) + "  -  " + check.player;
     check = check.same;
     if(check == null){
       pos = pos.next;
       check = pos;
       p++;
     }
     i++;
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
