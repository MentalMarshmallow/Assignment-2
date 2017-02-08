void newLevel()
{
  currentLevel++;
  
  if(totalLevels-1>currentLevel)
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
    
    //Remove all enemies
    while(enemies.size()!=0)
    {
      enemies.remove(0);
    }
    
    //Remove all weapons
    while(weapons.size()!=0)
    {
      weapons.remove(0);
    }
    
    initialise();
  }
  else if(currentLevel==totalLevels-1)//If its the last level
  {
    levels.add(new Level(3));
    currentRoom=0;
    
    levels.get(currentLevel).showRoom();
    //Get the current room and set it true for the map
    Room current;
    current = levels.get(currentLevel).rooms.get(currentRoom);//Gets the current level
    current.entered=true;
    map=new Map();
    map.update(' ');//Add the first room to the map
    
    //Remove all enemies
    while(enemies.size()!=0)
    {
      enemies.remove(0);
    }
    
    //Remove all weapons
    while(weapons.size()!=0)
    {
      weapons.remove(0);
    }
    
    //Load the boss
    
    table = loadTable("Boss.csv", "header");//The bosses csv file

    for (TableRow row : table.rows()) 
    {
      for (int i=0; i<3; i++)
      {
        enemies.add(new AI( 
          row.getString("title"), 
          row.getString("location"), 
          rows/2, 
          cols/2, 
          2, 
          row.getInt("totalHealth"), 
          row.getInt("attack"), 
          row.getInt("defense"), 
          row.getInt("dodgeChance")
          ));//AI(int index,String title,String location,int row,int col,int roomNum,int totalHealth,int attack,int defense,int dodgeChance)
      }
    } 
  }
  else if(currentLevel==totalLevels)//If the final level is surpassed
  {
    gameState=3;
  }
}