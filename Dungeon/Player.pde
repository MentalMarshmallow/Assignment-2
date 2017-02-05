/*
The player moves using the rows and cols and is an entity.
*/
class Player extends Entity
{  
  Player(String title,String location,int row,int col)
  {
    this.row=row;
    this.col=col;
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
         if (col <rows-1 && current.empty[row][col])
         col++;
         break;
        
        case LEFT:
         if (row> 0 && current.empty[row][col])
         row--;
         break;
         
        case RIGHT:
         if (row < cols-1 && current.empty[row][col])
         row++;
         break;
         
        default:
        break;
      }
    }
    if(!current.empty[row][col])
    {
      currentRoom++;
    }
  }
}