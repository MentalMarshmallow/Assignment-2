class AI extends Entity
{
  int roomNum;
  
  AI(String title,String location,int roomNum)
  {
    this.roomNum=roomNum;
    img = loadImage(location);
    this.title=title;
  }
  
  //Displays the AI
  void render()
  {
    image(img,row*boxWidth,col*boxHeight);
  }
  
  //Has all of the 
  void update()
  {
    
  }
}