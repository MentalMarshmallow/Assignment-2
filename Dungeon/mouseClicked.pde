void mouseClicked()
{
  int mouseRow;
  int mouseCol;
  mouseRow=(int)(mouseX/boxWidth);
  mouseCol=(int)(mouseY/boxHeight);
  
  //Check if any ai is around the player
  for (int i=0; i<enemies.size(); i++)
  {
    AI enemy=enemies.get(i);
    if(enemy.roomNum==currentRoom && mouseRow==enemy.row && mouseCol==enemy.col)
    {
      if (enemy.row==player.row-1 && enemy.col==player.col)
      {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(5);
        rect((enemy.row)*boxWidth, (enemy.col)*boxHeight, boxWidth, boxHeight);
      } 
      else if (enemy.row==player.row+1 && enemy.col==player.col)
      {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(5);
        rect((enemy.row)*boxWidth, (enemy.col)*boxHeight, boxWidth, boxHeight);
      } 
      else if (enemy.row==player.row && enemy.col==player.col-1)
      {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(5);
        rect((enemy.row)*boxWidth, (enemy.col)*boxHeight, boxWidth, boxHeight);
      } 
      else if (enemy.row==player.row && enemy.col==player.col+1)
      {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(5);
        rect((enemy.row)*boxWidth, (enemy.col)*boxHeight, boxWidth, boxHeight);
      }
      
    }//end if
    
  }//end for()
}