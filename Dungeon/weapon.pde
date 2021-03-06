class Weapon extends gameObject
{
  int maxDamage;
  int minDamage;
  int roomNum;
  boolean picked;//States if the item was picked up or not
  
  Weapon(String title,int minDamage, int maxDamage)//Starting weapon
  {
    this.title=title;
    this.minDamage=minDamage;
    this.maxDamage=maxDamage;
    picked=false;
  }
  
  Weapon(String title,String location,int col,int row,int roomNum,int minDamage, int maxDamage)//Weapon on the ground
  {
    this.roomNum=roomNum;
    this.row=row;
    this.col=col;
    img = loadImage(location);
    this.title=title;
    this.minDamage=minDamage;
    this.maxDamage=maxDamage;
    picked=false;
  }
  
  void render()
  {
    if(roomNum==currentRoom && !picked)
    {
      image(img,row*boxWidth,col*boxHeight,boxWidth,boxHeight);
    }
  }
}