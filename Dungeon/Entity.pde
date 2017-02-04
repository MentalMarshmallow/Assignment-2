abstract class Entity
{
  String title;//Name of the entity
  PImage img;//Image of the entity
  PVector pos;
  
  Entity()
  {
  }
  
  abstract void render();
  abstract void update();
}