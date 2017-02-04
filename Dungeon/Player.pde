class Player extends Entity
{
  Player(String title,String location,int row,int col)
  {
    pos = new PVector(row*boxWidth,col*boxHeight);
    img = loadImage(location);
    this.title=title;
  }
  
  void render()
  {
    image(img,pos.x,pos.y);
  }
  
  void update()
  {
    if(keyPressed)
    {
      switch (keyCode)
      {
        case UP:
         if(pos.y>0)
         pos.y-=boxHeight;
         break;
         
        case DOWN:
         if( (pos.y+boxHeight) < height)
         pos.y+=boxHeight;
         break;
        
        case LEFT:
         if(pos.x > 0)
         pos.x-=boxWidth;
         break;
         
        case RIGHT:
         if( (pos.x+boxWidth) < width)
         pos.x+=boxWidth;
         break;
         
        default:
        break;
      }
    }
  }
}