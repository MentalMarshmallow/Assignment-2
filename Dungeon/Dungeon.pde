ArrayList<AI> enemies;
Player player;//Player entity
Weapon weapon1;
Table table;
float boxWidth,boxHeight;
float border;
int rows,cols;
Level level;
Map map;
int totalRooms;
int currentRoom;
int gameState;

void setup()
{
  size(595,595);
  rows=11;//Set Rows
  cols=11;//Set Columns
  boxWidth=width/rows;
  boxHeight=height/cols;
  
  gameState=2;
  
  stroke(255);
  totalRooms=5;
  level =new Level(totalRooms);
  //level.printRooms();
  currentRoom=0;//Set the first room
  
  //Get the current room and set it true for the map
  Room current;
  current = level.rooms.get(currentRoom);
  current.entered=true;
  map=new Map();
  map.update(' ');//Add the first room to the map
  
  initialise();
  
  nextRoom();
  player.render();
}

void initialise()
{
  player = new Player("Player","Player.png",rows/2,cols/2,100,1,1,99);//Player(String title,String location,int col,int row,int totalHealth,int attack,int defense,int dodgeChance)
  //ArrayList for all enemy AI in the game
  enemies= new ArrayList<AI>();
  
  table = loadTable("Enemy.csv", "header");
  
  for (TableRow row : table.rows()) 
  {
    for(int i=0;i<3;i++)
    {
      int random;
      random =(int)random(1,totalRooms+1);
      enemies.add(new AI(i,row.getString("title"),
                        row.getString("location"),
                        rows/2,
                        cols/2,
                        random,
                        row.getInt("totalHealth"),
                        row.getInt("attack"),
                        row.getInt("defense"),
                        row.getInt("dodgeChance")
                        ));
    }
  }
//enemies.add(new AI(0,"Enemy1","Enemy1.png",rows/2,cols/2,1,100,1,1,1) );//AI(int index,String title,String location,int row,int col,int roomNum,int totalHealth,int attack,int defense,int dodgeChance)
  //enemies.add(new AI(1,"Enemy2","Enemy1.png",rows/2,cols/2,4,100,1,1,1) );
  
  weapon1= new Weapon("Weapon1","Weapon1.png",rows/2,cols/2,3,6,12);
}

void draw()
{
  //Creates the grid for the dungeon room
  if(gameState==2)
  {
    drawRoom();
  }
  else if(gameState==3)
  {
    exit();
  }
  /*Draws all of the entities
  for(int i=0;i<entities.size();i++)//Go through the details arraylist
  {
    Entity creature = entities.get(i);//retrieve data from the arraylist
    creature.display();
  }
  */
}