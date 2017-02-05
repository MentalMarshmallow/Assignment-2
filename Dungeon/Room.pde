/*
Class for creating a new room
It contains the size, the type and the number of exits.
It sets the rooms tiles to be different depending on what is in the room:
0 is set for empty spaces.
1 is set for exits.
2 is set for entrances.
3 is set for walls.
*/
class Room
{
  int rows;//Total rows in the room
  int cols;//Total columns in the room
  int tiles[][];//a 2-D array that stores what is on each tile
  boolean empty[][];//Check if tile is empty
  int numExits;//The number of exits in the room
  char entrance;//Character storing the location of the entrance to the room
  boolean up,left,right,down;//Set to say if any exits are unused
  int previousRoom;//Number indicating the location of the previous room
  boolean entered;
  
  Room(int rows,int cols,int numExits,char entrance,int previousRoom)
  {
    entered=false;//The room has not been entered
    
    this.previousRoom=previousRoom;
    this.rows=rows;
    this.cols=cols;
    this.numExits=numExits;
    this.entrance=entrance;
    
    tiles = new int[rows][cols];
    empty = new boolean[rows][cols];
    
    setEmpty();
    
    //Set 2 for the entrance in the tiles array
    switch(entrance)
    {
      case 'u':
       tiles[rows/2][0]=2;
       break;
       
      case 'd':
       tiles[rows/2][cols-1]=2;
       break;
      
      case 'l':
       tiles[0][cols/2]=2;
       break;
       
      case 'r':
       tiles[rows-1][cols/2]=2;
       break;
      
      default:
       break;
    }//end switch()
    
    
    //Creates an exit on a room. Set the tile to 1.
    for(int i=0;i<numExits;i++)
    {
      //Goes through the if statements until an exit is found
      while(true)
      {
        if(tiles[rows/2][0]==0)//Middle Upper
        {
          tiles[rows/2][0]=1;
          up=true;
          break;
        }
        if(tiles[rows/2][cols-1]==0)//Middle bottom
        {
          tiles[rows/2][cols-1]=1;
          down=true;
          break;
        }
        if(tiles[0][cols/2]==0)//Middle Left
        {
          tiles[0][cols/2]=1;
          left=true;
          break;
        }
        if(tiles[rows-1][cols/2]==0)//Middle Right
        {
          tiles[rows-1][cols/2]=1;
          right=true;
          break;
        }
      }
      
    }//End for() 
    
    //Sets all the perimeter to no wall blocks. Set to 3
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        if(tiles[i][j]==0)//Check if the tile is empty
        {
          if(i==0||i==rows-1||j==0||j==cols-1)//Check if the tile is on the perimeter
          {
            tiles[i][j]=3;
            empty[i][j]=false;
          }
        }
      }
    }
    
  }
  
  //Shows the values for the tiles of the room
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
  
  //Displays the room on the screen
  void render()
  {
    background(0,100,0);
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        if(tiles[i][j]==1||tiles[i][j]==2)
        {
          
          fill(0);
          rect(i*boxWidth,j*boxHeight,boxWidth,boxHeight);
          
        }
      }
    }
  }
  
  /*Checks if the tiles of the room are unused so an entity 
  can walk on the tile
  */
  void setEmpty()
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        
          empty[i][j]=true;
        
      }
    }
  }
  
  
  /*Gets the exit for the next room
  Sets the room to the opposite of the exit used. 
  This sets the exit of the room to the entrance of the next room
  */
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