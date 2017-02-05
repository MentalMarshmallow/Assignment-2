void nextRoom()
{
  Room current;//The current Room the player is in
  current = level.rooms.get(currentRoom);
  int currentRows=current.tiles.length;
  int currentCols=current.tiles[0].length;//Gets the total columns
  /*
  switch(current.entrance)
    {
      case 'u':
       player.row=currentRows/2;
       player.col=1;
       break;
       
      case 'd':
       player.row=currentRows/2;
       player.col=currentCols-2;
       break;
      
      case 'l':
       player.row=1;
       player.col=currentCols/2;
       break;
       
      case 'r':
       player.row=currentCols-2;
       player.col=currentCols/2;
       break;
      
      default:
       player.row=current.rows/2;
       player.col=current.cols/2;
       break;
    }//end switch()
    */
    if(player.row==currentRows/2 && player.col==0)//If player uses left exit
    {
      player.row=currentRows/2;
      player.col=currentCols-2;
    }
    if(player.row==currentRows/2 && player.col==currentCols-1)//If player uses right exit
    {
      player.row=currentRows/2;
      player.col=1;
    }
    if(player.row==0 && player.col==currentCols/2)//If player uses upper exit
    {
      player.row=currentRows-2;
      player.col=currentCols/2;
    }
    if(player.row==currentRows-1 && player.col==currentCols/2)//If player uses bottom exit
    {
      player.row=1;
      player.col=currentCols/2;
    }
}