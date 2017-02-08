/*
Only draws room if the 
*/
void drawRoom()
{
  if(keyPressed)//Only draws if the key is pressed
  {
    if(keyCode==UP||keyCode==DOWN||keyCode==LEFT||keyCode==RIGHT||key==' ' && selected||key==' ' && weaponSelected)
    {
      level.showRoom();
      player.update();
      player.render();
      playerInfo();
      backpackShow();
      
      map.render();
      
      delay(100);
      
      for(Entity enemy : enemies)//Go through the details arraylist
      {
        enemy.update();
        enemy.render();
      }
      
      for(Weapon weapon : weapons)//Go through the details arraylist
      {
        weapon.render();
      }//End for
      
    }
    
  }//End if
  
  if(inside)
  {
    player.backpack.render();
  }
  
}