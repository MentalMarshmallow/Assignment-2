ArrayList<AI> enemies;
ArrayList<Weapon> weapons;
Player player;//Player entity
Table table;//Table to get information
float boxWidth,boxHeight;
float border;
int rows,cols;
ArrayList<Level> levels;
int currentLevel;
Map map;
int totalRooms;
int currentRoom;
int gameState;
boolean selected;//If an enemy is selected to be attacked
boolean weaponSelected;//If a weapon is selected to be picked up
int selectedIndex;//Index of selected enemy
int weaponIndex;//Index of selected weapon
boolean inside;

void setup()
{
  size(595,595);
  rows=11;//Set Rows
  cols=11;//Set Columns
  boxWidth=width/rows;
  boxHeight=height/cols;
  
  gameState=2;
  selected=false;
  weaponSelected=false;
  inside=false;
  
  stroke(255);
  totalRooms=5;
  levels =new ArrayList<Level>();
  levels.add(new Level(totalRooms) );
  //level.printRooms();
  currentLevel=0;
  currentRoom=0;//Set the first room
  
  //Get the current room and set it true for the map
  Room current;
  current = levels.get(currentLevel).rooms.get(currentRoom);//Gets the current level
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
      enemies.add(new AI(i,
                        row.getString("title"),
                        row.getString("location"),
                        rows/2,
                        cols/2,
                        totalRooms-1-i,
                        row.getInt("totalHealth"),
                        row.getInt("attack"),
                        row.getInt("defense"),
                        row.getInt("dodgeChance")
                        ));//AI(int index,String title,String location,int row,int col,int roomNum,int totalHealth,int attack,int defense,int dodgeChance)
    }
  }
  
  weapons = new ArrayList<Weapon>();
  
  table = loadTable("Weapon.csv", "header");
  
  for (TableRow row : table.rows()) 
  {
    weapons.add(new Weapon(0,
                          row.getString("title"),
                          row.getString("location"),
                          rows/2,
                          cols/2,
                          totalRooms/2,
                          row.getInt("minDamage"),
                          row.getInt("maxDamage")
                          ));// Weapon(int index, String title,String location,int col,int row,int roomNum,int minDamage, int maxDamage)
  }
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
}