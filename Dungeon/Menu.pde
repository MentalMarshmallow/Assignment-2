void Menu()
{ 
  /*Text and boxes for the user to see
  */
  
  background(0);
  stroke(255,0,0);
  if(menu==0)
  {
    fill(255,0,0);
    textSize(width*0.1);
    text("Dungeon",width*0.28,height*0.1);
    
    fill(100);
    
    rect(width*0.3,height*0.2,width*0.4,height*0.6);//Big Box
    
    fill(80);
    rect(width*0.35,height*0.25,width*0.3,height*0.1);//Box 1
    rect(width*0.35,height*0.45,width*0.3,height*0.1);//Box 2
    
    fill(255,0,0);
    rect(width*0.35,height*0.85,width*0.3,height*0.1);
    
    fill(0);
    textSize(width*0.07);
    text("Exit",width*0.44,height*0.92);
    
    text("Play",width*0.425,height*0.325);
    text("Controls",width*0.36,height*0.525);
    
    if(mousePressed)
    {
      if(mouseX>width*0.35 && mouseX<width*0.65)
      {
        if(mouseY>height*0.25 && mouseY<height*0.35)
        {
          menu=1;
        }
        else if(mouseY>height*0.45 && mouseY<height*0.55)
        {
          menu=2;
        }
        else if(mouseY>height*0.85 && mouseY<height*0.95)
        {
          exit();
        }
      }
    
    }
  }
  else if(menu==1)
  {
    gameState=2;
    levels.get(currentLevel).showRoom();
    player.render();
  }
  else if(menu==2)
  {
    fill(100);
    
    textSize(width*0.1);
    rect(width*0.2,height*0.1,width*0.6,height*0.8);//Big Box
    
    fill(255,0,0);
    rect(width*0.35,height*0.75,width*0.3,height*0.1);//Box to go back to the menu
    
    text("Controls",width*0.3,height*0.2);
    
    fill(0);
    textSize(width*0.05);
    text("Back",width*0.45,height*0.8);
    
    textSize(width*0.03);
    text("Use Arrow Keys to move the player.",width*0.23,height*0.4);
    text("Click on an enemy or weapon to select",width*0.23,height*0.45);
    text("it. Then press the spaceBar to hit the",width*0.23,height*0.5);
    text("selected enemy or pick up the weapon",width*0.23,height*0.55);
    
    text("Click on the backpack on the bottom",width*0.23,height*0.65);
    text("right to equip and unequip items.",width*0.23,height*0.7);
    
    
    if(mousePressed)
    {
      if(mouseX>width*0.35 && mouseX<width*0.65)
      {
        if(mouseY>height*0.75 && mouseY<height*0.85)
        {
          menu=0;
        }
      }
    }
  }
  
}