class AI extends Entity
{
  int roomNum;
  
  AI(String title,String location,int roomNum,int row,int col)
  {
    this.roomNum=roomNum;
    this.row=row;
    this.col=col;
    img = loadImage(location);
    this.title=title;
  }
  
  //Displays the AI
  void render()
  {
    if(roomNum==currentRoom)
    image(img,row*boxWidth,col*boxHeight);
  }
  
  //Has all of the algorithms for the ai movement.
  void update()
  {
    //While loop is to make sure the ai moves in a direction
    while (true)
    {
      int random=(int)random(1,5);//Gets the direction the AI will move
      Room AI;//The current Room the AI is in
      AI= level.rooms.get(roomNum);
      
      if(random==1 && AI.empty[row][col-1])//AI goes up
      {
        
      }
      else if(random==1 && AI.empty[row][col+1])//AI goes down
      {
        
      }
      else if(random==1 && AI.empty[row-1][col])//AI goes left
      {
        
      }
      else if(random==1 && AI.empty[row+1][col])//AI goes right
      {
        
      }
    }
  }
}