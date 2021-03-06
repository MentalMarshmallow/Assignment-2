/*
The player moves using the rows and cols and is an entity.
 */
class Player extends Entity
{  
  healthBar health;
  Backpack backpack;

  Player(String title, String location, int col, int row, int totalHealth, int attack, int defense, int dodgeChance)
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

    weapon= new Weapon("Fist", 3, 10);
    backpack=new Backpack(5,"backpack.png");
  }
  
  void equip(Weapon store)
  {
    weapon = store;
  }
  
  void unequip()
  {
    weapon = new Weapon("Fist", 3, 10);
  }
  
  
  //The player got hit
  void hit(int damage)
  {
    boolean hit =(int)random(1, 100)>=dodgeChance;//Checks the probability of hitting based on dodgeChance

    if (hit)
    {
      health.current-=damage;
      text("*"+damage+"*",(row-1)*boxWidth,(col)*boxHeight);
      if (health.current<0)
      {
        gameState=3;
      }
      health.render();
    } else
    {
      fill(255,0,0);
      text("*DODGED*", (row-1)*boxWidth, col*boxHeight);
    }
  }


  void render()
  {
    image(img, row*boxWidth, col*boxHeight,boxWidth,boxHeight);
    if(inside)
    {
      backpack.render();
    }
  }

  void update()
  {
    Room current;//The current Room the player is in
    current = levels.get(currentLevel).rooms.get(currentRoom);
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
    
    if(key==' ' && selected)
    {
      int damage=attack-defense+(int)random(weapon.minDamage,weapon.maxDamage);
      
      AI enemy= enemies.get(selectedIndex);
      
      enemy.hit(damage);
      selected=false;
      selectedIndex=-1;
    }
    else if(key==' ' && weaponSelected)
    {
      weapons.get(selectedIndex).picked=true;
      weapons.get(selectedIndex).row=-10;//So the weapon cant be picked up again
      weapons.get(selectedIndex).col=-10;//So the weapon cant be picked up again
      println(weapons.get(selectedIndex).minDamage,selectedIndex);
      backpack.update(selectedIndex);
      weaponSelected=false;
    }


    if (current.tiles[row][col]==1)//The player is in the exit so currentRoom goes forward
    {
      currentRoom++;
      nextRoom();
    } 
    else if (current.tiles[row][col]==2)//The player is the entrance so currentRoom goes backwards
    {
      currentRoom--;
      nextRoom();
    }
    else if(current.tiles[row][col]==4)//If the player is on the level exit
    {
      newLevel();
    }
    

    current.empty[row][col]=false;//End of update we set the tile to not empty
  }
}