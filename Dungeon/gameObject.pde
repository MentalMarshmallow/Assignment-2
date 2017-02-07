abstract class gameObject
{
  String title;//Name of the object
  PImage img;//Image of the object
  int row;//row the entity is on
  int col;
  
  abstract void render();
}