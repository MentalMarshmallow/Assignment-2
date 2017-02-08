void mouseClicked()
{
  int mouseRow;
  int mouseCol;
  mouseRow=(int)(mouseX/boxWidth);
  mouseCol=(int)(mouseY/boxHeight);
  
  //If the backpack is clicked
  if(mouseX>width-boxWidth && mouseX<width && mouseY>height-boxHeight && mouseY<height)
  {
    inside=true;
  }
  
  //If the player is inside the backpack
  if(inside)
  {
    if(mouseX>size*2.5 && mouseX<size*3 && mouseY>size*2.5 && mouseY<size*3)//If the mouse is in the exit button
      {
        inside=false;
      }
      else if(mouseY<size*2+(size*2)/slots.length && mouseY<size*2)//If its on the backpack slots
      {
        for (int i=0; i<slots.length; i++)//Goes through backpack slots
        {
          if(mouseX>size+border/2 + i*(size*2/slots.length) && mouseX<size+border/2 + i*(size*2/slots.length) +(size*2)/slots.length-border)//Checks which backpack slot it is on
          {
            //Display the slot on the magnified slot
          }
        }//end for
        
      }
  }
  else
  {
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
}