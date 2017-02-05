void drawRoom()
{
  level.showRoom();
  
  player.render();
  
  delay(100);
  player.update();
}