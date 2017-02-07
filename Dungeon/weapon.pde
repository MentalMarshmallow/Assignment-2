class Weapon extends gameObject
{
  int maxDamage;
  int minDamage;
  
  Weapon(String title,int minDamage, int maxDamage)//Starting weapon
  {
    this.title=title;
    this.minDamage=minDamage;
    this.maxDamage=maxDamage;
  }
  
  Weapon(String title,String location,int col,int row,int minDamage, int maxDamage)//Weapon on the ground
  {
    this.row=row;
    this.col=col;
    img = loadImage(location);
    this.title=title;
    this.minDamage=minDamage;
    this.maxDamage=maxDamage;
  }
  
  void render()
  {
    image(img,row*boxWidth,col*boxHeight);
  }
}