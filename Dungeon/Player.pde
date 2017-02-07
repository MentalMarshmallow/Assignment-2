/*
The player moves using the rows and cols and is an entity.
*/
class Player extends Entity
{  
  healthBar health;
  
  Player(String title,String location,int col,int row,int totalHealth,int attack,int defense,int dodgeChance)
  {
    this.attack=attack;
    this.defense=defense;
    this.dodgeChance=dodgeChance;
    
    this.totalHealth=totalHealth;
    health=new healthBar(totalHealth);
    
    this.row=row;
    this.col=col;
    img = loadImage(location);
    this.title=title;
    
    weapon= new Weapon("Fist",3,10);
  }
  
  
  void hit(int damage)
  {
    boolean hit =(int)random(1,100)>=dodgeChance;//Checks the probability of hitting based on dodgeChance
    
    if(hit)
    {
      health.current-=damage;
      if(health.current<0)
      {
        gameState=3;
      }
      health.render();
    }
    else
    {
      text("*DODGED*",(row-1)*boxWidth,col*boxHeight);
      delay(20);
    }
    
  }
  
  
  void render()
  {
    image(img,row*boxWidth,col*boxHeight);
  }
  
  void update()
  {
    Room current;//The current Room the player is in
    current = level.rooms.get(currentRoom);
    current.empty[row][col]=true;
    
    //Checks if the arrow keys are pressed
    switch (keyCode)
    {
      case UP:
       if (col>0 && current.empty[row][col-1])
       col--;
       break;
       
      case DOWN:
       if (col <cols-1 && current.empty[row][col+1])
       col++;
       break;
      
      case LEFT:
       if (row> 0 && current.empty[row-1][col])
       row--;
       break;
       
      case RIGHT:
       if (row < rows-1 && current.empty[row+1][col])
       row++;
       break;
       
      default:
      break;
    }
    
    if(current.tiles[row][col]==1)//The player is in the exit so currentRoom goes forward
    {
      currentRoom++;
      nextRoom();
    }
    else if(current.tiles[row][col]==2)//The player is the entrance so currentRoom goes backwards
    {
      currentRoom--;
      nextRoom();
    }
    
    current.empty[row][col]=false;
  }
}