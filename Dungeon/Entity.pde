class Entity
{
  String name;//Image name of the entity
  PImage img;//Image of the entity
  int row;//The row it is on
  int col;//The column it is on
  
  Entity(String name)
  {
    this.name=name;
    img = loadImage(name);
  }
  
  void display()
  {
    image(img,250,250);
  }
}