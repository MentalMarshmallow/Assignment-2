class Level
{
  ArrayList<Room> rooms;//Creates an array of rooms for each level
  
  Level(int numRooms)
  {
    rooms = new ArrayList<Room>();
    rooms.add(new Room(rows,cols,3,'n') );//Starting room has no entrance
    
    //Creates an arraylist the size of numRooms 
    while(numRooms>rooms.size())
    {
      Room temp;
      temp = rooms.get(rooms.size()-1);//Used to get the exit of the previous room
      
      rooms.add(new Room(rows,cols,1,temp.getExit()) );//Adds a new room
    }
    
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