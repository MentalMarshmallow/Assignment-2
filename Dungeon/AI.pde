class AI extends Entity
{
  int roomNum;
  
  AI(String title,String location,int row,int col,int roomNum,int totalHealth,int attack,int defense,int dodgeChance)
  { 
    this.attack=attack;
    this.defense=defense;
    this.dodgeChance=dodgeChance;
    
    this.totalHealth=totalHealth;
    currentHealth=totalHealth;
    
    this.roomNum=roomNum;
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
      fill(255,0,0);
      currentHealth-=damage;
      text("*"+damage+"*",(row-1)*boxWidth,(col)*boxHeight);
      
      if(currentHealth<0)
      {
        Room AI;//The current Room the AI is in
        AI= levels.get(currentLevel).rooms.get(roomNum);
    
        AI.empty[row][col]=true;
        removeAI(selectedIndex);
      }
    }
    else
    {
      text("*DODGED*",(row-1)*boxWidth,col*boxHeight);
    }
    
    
  }
  
  //Displays the AI
  void render()
  {
    if(roomNum==currentRoom)
    {
      image(img,row*boxWidth,col*boxHeight,boxWidth,boxHeight);
    }
  }
  
  //Has all of the algorithms for the ai movement.
  void update()
  {
    Room AI;//The current Room the AI is in
    AI= levels.get(currentLevel).rooms.get(roomNum);
    
    AI.empty[row][col]=true;//At beginning of update make the ai tile empty
    
    //If the ai is not in the room
    if(roomNum!=currentRoom)
    {
      //While loop is to make sure the ai moves in a direction
      while (true)
      {
        int random=(int)random(1,5);//Gets the direction the AI will move
        
        if(random==1 && AI.empty[row][col-1])//AI goes up
        {
          col--;
          break;
        }
        else if(random==2 && AI.empty[row][col+1])//AI goes down
        {
          col++;
          break;
        }
        else if(random==3 && AI.empty[row-1][col])//AI goes left
        {
          row--;
          break;
        }
        else if(random==4 && AI.empty[row+1][col])//AI goes right
        {
          row++;
          break;
        }
        
      }//end while()
      
      
    }//end if
    
    //If the ai is in the room and 1 tile away from the player then attack the player. This means the ai gets the first hit if the player stumbles into the room
    else if ( player.row-1==row && player.col==col || player.row+1==row && player.col==col || player.row==row && player.col-1==col || player.row==row && player.col+1==col)
    {
      int damage=attack-defense+(int)random(weapon.minDamage,weapon.maxDamage);
      player.hit(damage);
    }
    
    /*
    If the ai is not in the currentRoom.
    This is the ai's control while in the same room as the player.
    It prioritizes going closer to the player based on its row.
    */
    else
    {
      if(player.row<row && player.col==col && AI.empty[row-1][col])
      {
        row--;
      }
      else if(player.row<row && player.col<col && AI.empty[row-1][col])
      {
        row--;
      }
      else if(player.row<row && player.col>col && AI.empty[row-1][col])
      {
        row--;
      } 
      else if(player.row==row && player.col<col && AI.empty[row][col-1])
      {
        col--;
      }
      else if(player.row==row && player.col>col && AI.empty[row][col+1])
      {
        col++;
      }
      else if(player.row>row && player.col==col && AI.empty[row+1][col])
      {
        row++;
      }
      else if(player.row>row && player.col<col && AI.empty[row+1][col])
      {
        row++;
      }
      else if(player.row>row && player.col>col && AI.empty[row+1][col])
      {
        row++;
      }
      
    }
    
    if(AI.tiles[row][col]==1)//If the AI is on an exit
    {
      roomNum++;
      nextRoom();
    }
    else if(AI.tiles[row][col]==2)//If the AI is on an entrance
    {
      roomNum--;
      nextRoom();
    }

    //If in the same room as the player the ai block is not empty
    if(roomNum==currentRoom)
    {
      AI.empty[row][col]=false;//At the end of update make the ai tile full
    }
    
  }//end update()
  
}//end class AI