abstract class Entity
{
  String title;//Name of the entity
  PImage img;//Image of the entity
  PVector pos;
  
  abstract void render();
  abstract void update();
}