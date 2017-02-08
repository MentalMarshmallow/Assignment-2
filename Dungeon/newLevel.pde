void newLevel()
{
  currentLevel++;
  
  if(totalLevels>currentLevel)
  {
    levels.add(new Level(totalRooms));
    currentRoom=0;//Set the first room
    levels.get(currentLevel).showRoom();
    //Get the current room and set it true for the map
    Room current;
    current = levels.get(currentLevel).rooms.get(currentRoom);//Gets the current level
    current.entered=true;
    map=new Map();
    map.update(' ');//Add the first room to the map
    
    initialise();
  }
}