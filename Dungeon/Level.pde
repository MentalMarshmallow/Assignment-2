class Level
{
  ArrayList<Room> rooms;//Creates an array of rooms for each level
  
  Level(int numRooms)
  {
    rooms = new ArrayList<Room>();
    rooms.add(new Room(rows,cols,3,'n') );//Starting room has no entrance
    /*
    while(numRooms<rooms.size())
    {
      rooms.add(new Room(rows,cols,) );
    }
    */
  }
}