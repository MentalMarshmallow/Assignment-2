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
boolean selected;//If an enemy is selected to be attacked
int selectedIndex;//Index of selected enemy

void setup()
{
  size(595,595);
  rows=11;//Set Rows
  cols=11;//Set Columns
  boxWidth=width/rows;
  boxHeight=height/cols;
  
  gameState=2;
  selected=false;
  
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
      enemies.add(new AI(i,row.getString("title"),
                        row.getString("location"),
                        rows/2,
                        cols/2,
                        totalRooms-1-i,
                        row.getInt("totalHealth"),
                        row.getInt("attack"),
                        row.getInt("defense"),
                        row.getInt("dodgeChance")
                        ));
    }
  }
  
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