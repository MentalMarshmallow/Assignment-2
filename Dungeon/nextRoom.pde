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
}