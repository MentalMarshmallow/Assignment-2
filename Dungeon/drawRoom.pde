void drawRoom()
{
  if(keyPressed)
  {
    level.showRoom();
    map.render();
    player.update();
    player.render();
    
    delay(100);
  }
}