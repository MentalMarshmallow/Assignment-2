class Level
{
  ArrayList<Room> rooms;//Creates an array of rooms for each level
  int totalRows;//Total Rows in the level
  int totalCols;//Total columns in the level
  
  Level(int numRooms)
  {
    int roomNumber;//Stores the index of the current room
    totalRows=totalCols=0;//set the rows and cols to 0
    
    rooms = new ArrayList<Room>();
    rooms.add(new Room(rows,cols,1,'n') );//Starting room has no entrance
    roomNumber=0;
    
    totalRows+=rows;
    totalCols+=cols;
    
    //Creates an arraylist the size of numRooms 
    while(numRooms-1>rooms.size())
    {
      Room temp;
      temp = rooms.get(rooms.size()-1);//Used to get the exit of the previous room
      roomNumber++;
      
      rooms.add(new Room(rows,cols,1,temp.getExit(roomNumber ) ) );//Adds a new room
      
      switch(rooms.get(roomNumber).entrance)//Gets the direction of the entrance to the room
      {
        case 'u':
         rooms.get(roomNumber).connected[0]=roomNumber-1;
         break;
         
        case 'd':
         rooms.get(roomNumber).connected[1]=roomNumber-1;
         break;
        
        case 'l':
         rooms.get(roomNumber).connected[2]=roomNumber-1;
         break;
         
        case 'r':
         rooms.get(roomNumber).connected[3]=roomNumber-1;
         break;
        
        default:
         break;
      }//end switch()
      
      totalRows+=rows;
      totalCols+=cols;
    }
    
    Room temp;
    temp = rooms.get(rooms.size()-1);//Used to get the exit of the previous room
    roomNumber++;
    
    rooms.add(new Room(rows,cols,0,temp.getExit( roomNumber ) ) );//Adds the final room
    totalRows+=rows;
    totalCols+=cols;
  }
  
  void previousRoom()
  {
    for(int i=0;i<rooms.size();i++)//Go through each room
    {
      Room temp;
      temp = rooms.get(i);
      
      for(int j=0;j<temp.connected.length;j++)//Check all the connected rooms
      {
        if(temp.connected[j]!=0)
        {
          
        }
      }
    }
  }
  
  void showRoom()
  {
    Room temp;
    temp = rooms.get(currentRoom);
    
    temp.render();
  }
  
  void printRooms()
  {
    for(int i=0;i<rooms.size();i++)
    {
      Room temp;
      
      temp = rooms.get(i);
      
      temp.getMatrix();
      
      println("New Room \n \n");
    }
  }
  
}