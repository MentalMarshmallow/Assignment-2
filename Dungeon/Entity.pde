abstract class Entity
{
  String title;//Name of the entity
  PImage img;//Image of the entity
  int row;//row the entity is on
  int col;
  int totalHealth;
  int currentHealth;
  int attack;
  int defense;
  int dodgeChance;
  Weapon weapon;
  
  abstract void render();
  abstract void update();
}