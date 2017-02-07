void mouseClicked()
{
  int mouseRow;
  int mouseCol;
  mouseRow=(int)(mouseX/boxWidth);
  mouseCol=(int)(mouseY/boxHeight);
  
  /*
  Check if any ai is around the player
  If the mouse clicked the enemy around the player it creates a red square around the enemy,
  and if the enemy is clicked again then it attacks the enemy. 
  */
  for (int i=0; i<enemies.size(); i++)
  {
    AI enemy=enemies.get(i);
    
    //Check if the mouse clicks an enemy around the player
    if(enemy.roomNum==currentRoom && mouseRow==enemy.row && mouseCol==enemy.col)
    {
      if (enemy.row==player.row-1 && enemy.col==player.col)
      {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(3);
        rect((enemy.row)*boxWidth, (enemy.col)*boxHeight, boxWidth, boxHeight);
        
        selected=true;
        selectedIndex=i;
      } 
      else if (enemy.row==player.row+1 && enemy.col==player.col)
      {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(3);
        rect((enemy.row)*boxWidth, (enemy.col)*boxHeight, boxWidth, boxHeight);
        
        selected=true;
        selectedIndex=i;
      } 
      else if (enemy.row==player.row && enemy.col==player.col-1)
      {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(3);
        rect((enemy.row)*boxWidth, (enemy.col)*boxHeight, boxWidth, boxHeight);
        
        selected=true;
        selectedIndex=i;
      } 
      else if (enemy.row==player.row && enemy.col==player.col+1)
      {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(3);
        rect((enemy.row)*boxWidth, (enemy.col)*boxHeight, boxWidth, boxHeight);
        
        selected=true;
        selectedIndex=i;
      }
      
    }//end if
    
  }//end for()
  
  
  
  for (int i=0; i<weapons.size(); i++)
  {
    Weapon weapon= weapons.get(i);
    
    //Check if the mouse clicks an weapon around the player
    if(weapon.roomNum==currentRoom && mouseRow==weapon.row && mouseCol==weapon.col)
    {
      if (weapon.row==player.row-1 && weapon.col==player.col)
      {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(3);
        rect((weapon.row)*boxWidth, (weapon.col)*boxHeight, boxWidth, boxHeight);
        
        weaponSelected=true;
        selectedIndex=i;
      } 
      else if (weapon.row==player.row+1 && weapon.col==player.col)
      {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(3);
        rect((weapon.row)*boxWidth, (weapon.col)*boxHeight, boxWidth, boxHeight);
        
        weaponSelected=true;
        selectedIndex=i;
      } 
      else if (weapon.row==player.row && weapon.col==player.col-1)
      {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(3);
        rect((weapon.row)*boxWidth, (weapon.col)*boxHeight, boxWidth, boxHeight);
        
        weaponSelected=true;
        selectedIndex=i;
      } 
      else if (weapon.row==player.row && weapon.col==player.col+1)
      {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(3);
        rect((weapon.row)*boxWidth, (weapon.col)*boxHeight, boxWidth, boxHeight);
        
        weaponSelected=true;
        selectedIndex=i;
      }
      
    }//end if
    
  }//end for()
}