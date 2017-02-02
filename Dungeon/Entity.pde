class Entity
{
  String title;//Name of the entity
  PImage img;//Image of the entity
  int row;//The row it is on
  int col;//The column it is on
  
  Entity(String title,String location,int row,int col)
  {
    this.title=title;
    this.row=row;
    this.col=col;
    img = loadImage(location);
  }
  
  String getTitle()
  {
    return title;
  }
  
  void display()
  {
    image(img,row*boxWidth,col*boxHeight);
  }
}