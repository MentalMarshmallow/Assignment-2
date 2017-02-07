class healthBar implements Bar
{
  float total;//The total health the healthBar can have
  float current;
  
  healthBar(float total)
  {
    this.total=total;
    current=total;
  }
  
  void gainBar()
  {
    
  }
  
  void reduceBar()
  {
    
  }
  
  void update()
  {
    
  }
  
  void render()
  {
    fill(255,0,0);
    text("Health: ",5,boxHeight/2);
    
    //Draw the healthbox
    stroke(150);
    strokeWeight(5);
    fill(100);
    rect(boxWidth*0.85,boxHeight/4,boxWidth*2,boxHeight/3);
    
    //Draw the health
    fill(255,0,0);
    noStroke();
    rect(boxWidth*0.9,boxHeight/4+2.5,(current/total) * boxWidth*2-5,boxHeight/3-5);
    strokeWeight(1);
    
  }
}