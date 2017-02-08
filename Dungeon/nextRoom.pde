void nextRoom()
{
  levels.get(currentLevel).showRoom();//Shows the next Room
  
  Room current;//The current Room the player is in
  current = levels.get(currentLevel).rooms.get(currentRoom);
  int currentRows=current.tiles.length;
  int currentCols=current.tiles[0].length;//Gets the total column
  
  //Places player at the front of the exit
  if(player.row==currentRows/2 && player.col==0)//If player uses upper exit
  {
    if(!current.entered)
    {
      current.entered=true;
      map.update('u');
    }
    
    player.row=currentRows/2;
    player.col=currentCols-2;
  }
  if(player.row==currentRows/2 && player.col==currentCols-1)//If player uses bottom exit
  { 
    if(!current.entered)
    {
      current.entered=true;
      map.update('d');
    }
    
    player.row=currentRows/2;
    player.col=1;
  }
  if(player.row==0 && player.col==currentCols/2)//If player uses left exit
  {
    if(!current.entered)
    {
      current.entered=true;
      map.update('l');
    }
    
    player.row=currentRows-2;
    player.col=currentCols/2;
  }
  if(player.row==currentRows-1 && player.col==currentCols/2)//If player uses right exit
  {
    if(!current.entered)
    {
      current.entered=true;
      map.update('r');
    }
    
    player.row=1;
    player.col=currentCols/2;
  }
  
  //Send enemies to the entrances
  for(AI enemy: enemies)
  {
    
    Room AIRoom;//The current Room the AI is in
    AIRoom= levels.get(currentLevel).rooms.get(enemy.roomNum);
    
    if(enemy.row==AIRoom.rows/2 && enemy.col==0)//If enemy uses upper exit
    {
      enemy.row=AIRoom.rows/2;
      enemy.col=AIRoom.cols-2;
    }
    if(enemy.row==AIRoom.rows/2 && enemy.col==AIRoom.cols-1)//If enemy uses bottom exit
    { 
      enemy.row=AIRoom.rows/2;
      enemy.col=1;
    }
    if(enemy.row==0 && enemy.col==AIRoom.cols/2)//If enemy uses left exit
    {
      enemy.row=AIRoom.rows-2;
      enemy.col=AIRoom.cols/2;
    }
    if(enemy.row==AIRoom.rows-1 && enemy.col==AIRoom.cols/2)//If enemy uses right exit
    {
      enemy.row=1;
      enemy.col=AIRoom.cols/2;
    }
  }
  
}