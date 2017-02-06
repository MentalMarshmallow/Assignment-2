void nextRoom()
{
  level.showRoom();//Shows the next Room
  
  Room current;//The current Room the player is in
  current = level.rooms.get(currentRoom);
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
  for(int i=0;i<enemies.size();i++)
  {
    AI enemy=enemies.get(i);
    
    if(enemy.row==currentRows/2 && enemy.col==0)//If enemy uses upper exit
    {
      enemy.row=currentRows/2;
      enemy.col=currentCols-2;
    }
    if(enemy.row==currentRows/2 && enemy.col==currentCols-1)//If enemy uses bottom exit
    { 
      enemy.row=currentRows/2;
      enemy.col=1;
    }
    if(enemy.row==0 && enemy.col==currentCols/2)//If enemy uses left exit
    {
      enemy.row=currentRows-2;
      enemy.col=currentCols/2;
    }
    if(enemy.row==currentRows-1 && enemy.col==currentCols/2)//If enemy uses right exit
    {
      enemy.row=1;
      enemy.col=currentCols/2;
    }
  }
  
}