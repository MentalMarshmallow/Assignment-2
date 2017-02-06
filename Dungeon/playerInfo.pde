void playerInfo()
{
  noStroke();
  fill(0);
  rect(0,0,boxWidth*3,boxHeight);
  player.health.render();
  stroke(255);
}