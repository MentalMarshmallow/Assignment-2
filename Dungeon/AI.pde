class AI extends Entity
{
  int roomNum;
  
  AI(String title,String location,int row,int col,int roomNum)
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
    println(row,col,"\n new\n");
    Room AI;//The current Room the AI is in
    AI= level.rooms.get(roomNum-1);
    
    if(AI.tiles[row][col]==1)//If the AI is on an exit
    {
      roomNum++;
    }
    else if(AI.tiles[row][col]==2)//If the AI is on an entrance
    {
      roomNum--;
    }
    
    //If the player is not in the room
    if(roomNum!=currentRoom)
    {
      //While loop is to make sure the ai moves in a direction
      while (true)
      {
        int random=(int)random(1,5);//Gets the direction the AI will move
        
        if(random==1 && AI.empty[row][col-1])//AI goes up
        {
          col--;
          break;
        }
        else if(random==2 && AI.empty[row][col+1])//AI goes down
        {
          col++;
          break;
        }
        else if(random==3 && AI.empty[row-1][col])//AI goes left
        {
          row--;
          break;
        }
        else if(random==4 && AI.empty[row+1][col])//AI goes right
        {
          row++;
          break;
        }
        
      }//end while()
      
      
    }//end if
    else 
    {
      if(player.row<row && player.col==col && AI.empty[row-1][col])
      {
        row--;
      }
      else if(player.row<row && player.col<col && AI.empty[row-1][col] && AI.empty[row][col-1])
      {
        int random=(int)random(1,3);
          
          if(random==1)
          {
            row--;
          }
          else
          {
            col--;
          }
      }
      else if(player.row<row && player.col>col && AI.empty[row-1][col] && AI.empty[row][col+1])
      {
        int random=(int)random(1,3);
          
          if(random==1)
          {
            row--;
          }
          else
          {
            col++;
          }
      } 
      else if(player.row==row && player.col<col && AI.empty[row][col-1])
      {
        col--;
      }
      else if(player.row==row && player.col>col && AI.empty[row][col+1])
      {
        col++;
      }
      else if(player.row>row && player.col==col && AI.empty[row+1][col])
      {
        row++;
      }
      else if(player.row>row && player.col<col && AI.empty[row+1][col] && AI.empty[row][col+1])
      {
        int random=(int)random(1,3);
          
          if(random==1)
          {
            row++;
          }
          else
          {
            col++;
          }
      }
      else if(player.row>row && player.col>col && AI.empty[row+1][col] && AI.empty[row][col-1])
      {
        int random=(int)random(1,3);
          
          if(random==1)
          {
            row++;
          }
          else
          {
            col--;
          }
      }
      
    }
    
  }//end update()
  
}//end class AI