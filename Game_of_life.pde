PGraphics pg;
  int rows=100;
  int columns=100;
  
  
  int[][] board = new int[columns][rows];
  int[][] next_board = new int[columns][rows];


void setup(){
  size(500, 500);
  frameRate(120);

  
  for (int x=0; x<columns; x++){
    for (int y=0; y<rows; y++){
      board[x][y]=0;
      if(x>30 && x<70 && y>30 && y<70){
      board[x][y]=int(random(2));}
    }
  }
    print(min(0, 1));
}

void draw(){
  //int[][] board = new int[columns][rows];
  
  // Update 
  for (int x=0; x<columns; x++){
    for (int y=0; y<rows; y++){
      int count=0;
      for(int i=max(0, x-1); i<min(columns, x+2); i++){
        for(int j=max(0, y-1); j<min(rows, y+2); j++){
          if(board[i][j]==1 && (i!=x || j!=y)){count=count+1;}
        }
      }
     
      next_board[x][y]=board[x][y];
      if(board[x][y]==1){
        if(count==2||count==3){
          next_board[x][y]=1;
        }else{next_board[x][y]=0;}
      }else{
        if(count==3){
          next_board[x][y]=1;
        }  
      }
      
    
      //next_board[x][y]=int(random(2));
      
      
    }
  }
  
  // Draw
    for (int x=0; x<columns; x++){
    for (int y=0; y<rows; y++){
      board[x][y]=next_board[x][y];
      
      if(board[x][y]==0){
      fill(0);}else{fill(255);}
      rect(x*5, y*5, 50, 50);
    }
  }
  
  
}