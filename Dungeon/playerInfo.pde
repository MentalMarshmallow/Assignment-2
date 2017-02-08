void playerInfo()
{
  noStroke();
  fill(0);
  rect(0,0,boxWidth*3,boxHeight);
  player.health.render();
  stroke(255);
}

//Shows the backpack on a room
void backpackShow()
{
  rect(width-boxWidth,height-boxHeight,boxWidth,boxHeight);//Backpack outline
  
  //This is to display the backpacks image
  image(player.backpack.img, width-boxWidth, height - boxHeight,boxWidth,boxHeight);
}