void drawRoom()
{
  if(keyPressed)
  {
    level.showRoom();
    player.update();
    player.render();
    playerInfo();
    
    map.render();
    
    delay(100);
    
    for(int i=0;i<enemies.size();i++)//Go through the details arraylist
    {
      Entity enemy = enemies.get(i);//retrieve data from the arraylist
      enemy.update();
      enemy.render();
    }
    
    weapon1.render();
  }
}