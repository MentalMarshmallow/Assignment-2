abstract class Entity
{
  String title;//Name of the entity
  PImage img;//Image of the entity
  int row;
  int col;
  healthBar health;
  
  abstract void render();
  abstract void update();
}