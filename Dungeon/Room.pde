/*
Class for creating a new room
It contains the size, the type and the number of exits.
*/
class Room
{
  int tiles[][];//a 2-D array that stores what is on each tile
  int numExits;//The number of exits in the room
  char entrance;
  boolean up,left,right,down;//Set to say if any exits are unused
  
  Room(int rows,int cols,int numExits,char entrance)
  {
    tiles = new int[rows][cols];
    this.numExits=numExits;
    
    this.entrance=entrance;
    //Set 2 for the entrance in the tiles array
    switch(entrance)
    {
      case 'u':
       tiles[cols/2][0]=2;
       break;
       
      case 'd':
       tiles[cols/2][rows-1]=2;
       break;
      
      case 'l':
       tiles[0][rows/2]=2;
       break;
       
      case 'r':
       tiles[cols-1][rows/2]=2;
       break;
      
      default:
       break;
    }//end switch()
    
    
    //Creates an exit on a room. Set the tile to 1.
    for(int i=0;i<numExits;i++)
    {
      if(tiles[0][rows/2]==0)//Middle Left
      {
        tiles[0][rows/2]=1;
        left=true;
      }
      if(tiles[cols/2][0]==0)//Middle Upper
      {
        tiles[cols/2][0]=1;
        up=true;
      }
      if(tiles[cols-1][rows/2]==0)//Middle Right
      {
        tiles[cols-1][rows/2]=1;
        right=true;
      }
      if(tiles[cols/2][rows-1]==0)//Middle bottom
      {
        tiles[cols/2][rows-1]=1;
        down=true;
      }
      
    }//End for() 
    
  }
  
  void getMatrix()
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        println(tiles[i][j]);
      }
      println("*******");
    }
  }
  
  void render()
  {
    for(float i=0;i<width;i+=boxWidth)
    {
      line(i,0,i,height);
    }
    for(float j=0;j<height;j+=boxHeight)
    {
      line(0,j,width,j);
    }
  }
  
  //Gets the exit for the next room
  char getExit()
  {
    //Check if there are any unused exits
    if(left)
    {
      left=false;
      return 'r';
    }
    if(right)
    {
      right=false;
      return 'l';
    }
    if(up)
    {
      up=false;
      return 'd';
    }
    if(down)
    {
      down=false;
      return 'u';
    }
    
    return 'n';
    
  }
  
}