/*
Class for creating a new room
It contains the size, the type and the number of exits.
*/
class Room
{
  int tiles[][];//a 2-D array that stores what is on each tile
  int numExits;//The number of exits in the room
  
  Room(int rows,int cols,int numExits,char entrance)
  {
    tiles = new int[rows][cols];
    this.numExits=numExits;
    
    //Creates up to exits on a room. 1 is used to indicate the exit
    for(int i=0;i<numExits;i++)
    {
      if(tiles[0][rows/2]!=0)//Middle Left
      {
        tiles[0][rows/2]=1;
      }
      if(tiles[cols/2][0]!=0)//Middle Upper
      {
        tiles[cols/2][0]=1;
      }
      if(tiles[cols][rows/2]!=0)//Middle Right
      {
        tiles[cols][rows/2]=1;
      }
      if(tiles[cols/2][rows]!=0)//Middle bottom
      {
        tiles[cols/2][rows]=1;
      }
    }
  }
}