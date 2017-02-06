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
    fill(255,0,0);
    stroke(100);
    strokeWeight(5);
    rect(boxWidth*0.85,boxHeight/4,boxWidth*2,boxHeight/3);
    strokeWeight(1);
    
  }
}