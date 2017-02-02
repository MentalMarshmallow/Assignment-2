class Entity
{
  PImage img;//Image of the entity
  int row;//The row it is on
  int col;//The column it is on
  
  Entity(String name,int row,int col)
  {
    this.row=row;
    this.col=col;
    img = loadImage(name);
  }
  
  void display()
  {
    image(img,row*boxWidth,col*boxHeight);
  }
}