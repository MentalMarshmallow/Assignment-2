class Weapon extends gameObject
{
  int maxDamage;
  int minDamage;
  int roomNum;
  int index;
  
  Weapon(String title,int minDamage, int maxDamage)//Starting weapon
  {
    this.title=title;
    this.minDamage=minDamage;
    this.maxDamage=maxDamage;
  }
  
  Weapon(int index, String title,String location,int col,int row,int roomNum,int minDamage, int maxDamage)//Weapon on the ground
  {
    this.roomNum=roomNum;
    this.row=row;
    this.col=col;
    img = loadImage(location);
    this.title=title;
    this.minDamage=minDamage;
    this.maxDamage=maxDamage;
  }
  
  void render()
  {
    if(roomNum==currentRoom)
    {
      image(img,row*boxWidth,col*boxHeight,boxWidth,boxHeight);
    }
  }
}