void drawRoom()
{
  if(keyPressed)
  {
    level.showRoom();
    player.update();
    player.render();
    displayMap();
    
    delay(100);
  }
}