/*
The player moves using the rows and cols and is an entity.
*/
class Player extends Entity
{  
  Player(String title,String location)
  {
    img = loadImage(location);
    this.title=title;
  }
  
  void render()
  {
    image(img,row*boxWidth,col*boxHeight);
  }
  
  void update()
  {
    Room current;//The current Room the player is in
    current = level.rooms.get(currentRoom);
    
    if(keyPressed)
    {
      switch (keyCode)
      {
        case UP:
         if (col>0 && current.empty[row][col])
         col--;
         break;
         
        case DOWN:
         if (col <cols-1 && current.empty[row][col])
         col++;
         break;
        
        case LEFT:
         if (row> 0 && current.empty[row][col])
         row--;
         break;
         
        case RIGHT:
         if (row < rows-1 && current.empty[row][col])
         row++;
         break;
         
        default:
        break;
      }
    }
    
    if(current.tiles[row][col]==1)//The player is in the exit so currentRoom goes forward
    {
      currentRoom++;
      nextRoom();
    }
    else if(current.tiles[row][col]==2)//The player is the entrance so currentRoom goes backwards
    {
      currentRoom--;
      nextRoom();
    }
  }
}