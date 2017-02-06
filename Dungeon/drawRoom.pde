void drawRoom()
{
  if(keyPressed)
  {
    level.showRoom();
    map.render();
    player.update();
    player.render();
    
    delay(100);
    
    for(int i=0;i<enemies.size();i++)//Go through the details arraylist
    {
      Entity enemy = enemies.get(i);//retrieve data from the arraylist
      enemy.update();
      enemy.render();
    }
  }
}