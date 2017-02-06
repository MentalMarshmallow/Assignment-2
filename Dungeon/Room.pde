/*
Class for creating a new room
It contains the size, the type and the number of exits.
It sets the rooms tiles to be different depending on what is in the room:
0 is set for empty spaces.
1 is set for exits.
2 is set for entrances.
3 is set for walls.
4 is set for the entrance to the next level.
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
  int connected[];//Numbers indicating the location of the connected rooms. indexs: 0 is up. 1 is down. 2 is left. 3 is right. 
  boolean entered;
  
  Room(int rows,int cols,int numExits,char entrance)
  {
    entered=false;//The room has not been entered
    connected=new int[4];//The room can have a max of 4 exits
    
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
        int random=(int)random(0,4);//Set the room to be on a random side
        
        if(tiles[rows/2][0]==0 && random==0)//Middle Upper
        {
          tiles[rows/2][0]=1;
          up=true;
          break;
        }
        if(tiles[rows/2][cols-1]==0 && random==1)//Middle bottom
        {
          tiles[rows/2][cols-1]=1;
          down=true;
          break;
        }
        if(tiles[0][cols/2]==0 && random==2)//Middle Left
        {
          tiles[0][cols/2]=1;
          left=true;
          break;
        }
        if(tiles[rows-1][cols/2]==0 && random==3)//Middle Right
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
    }//End for ()
    
  }//End constructor
  
  //Shows the values for the tiles of the room
  void getMatrix()
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        //println(tiles[i][j]);
        println(empty[i][j]);
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
        else if(tiles[i][j]==3)
        {
          fill(255,0,255);
          rect(i*boxWidth,j*boxHeight,boxWidth,boxHeight);
        }
        else if(tiles[i][j]==4)
        {
          fill(0,0,255);
          rect(i*boxWidth,j*boxHeight,boxWidth,boxHeight);
        }
      }
    }
  }
  
  /*
  Checks if the tiles of the room are unused so an entity 
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
  
  
  /*
  Gets the exit for the next room
  Sets the room to the opposite of the exit used. 
  This sets the exit of the room to the entrance of the next room.
  It also takes in the room index of the room that calls the function.
  This index is then used to connect the rooms together
  */
  char getExit(int roomIndex)
  {
    //Check if there are any unused exits
    if(up)
    {
      connected[0]=roomIndex;
      up=false;
      return 'd';
    }
    if(down)
    {
      connected[1]=roomIndex;
      down=false;
      return 'u';
    }
    if(left)
    {
      connected[2]=roomIndex;
      left=false;
      return 'r';
    }
    if(right)
    {
      connected[3]=roomIndex;
      right=false;
      return 'l';
    }
    
    return 'n';
    
  }
  
  /*
  Sets the tile for the next level. Set to 4.
  */
  void setNextLevel()
  {
    tiles[rows/2][cols/2]=4;
  }
  
}