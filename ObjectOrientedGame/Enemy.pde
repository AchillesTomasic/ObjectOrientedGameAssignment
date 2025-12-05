class Enemy{
  int movementType; // decides what type of movement the enemy uses
  // sounds for enemy // 
  SoundFile damagedSFX; // sound for enemy being hit
  SoundFile explodeSFX; // sound for explosion
  // images for the enemy //
  PImage enemyImage = loadImage("strawBerry.png"); // image for the enemy
  PImage explosionImage = loadImage("explode.gif"); // image for the explosion
  // spawn timers //
  int spawnTime;// determines when the enemy becomes active
  // movement vairables for the enemy //
  PVector position = new PVector(); //initalizes the enemy position
  PVector velocity = new PVector(); //initalizes the enemy velocity
  PVector acceleration = new PVector(0,-0.1); // initalizes the enemyh acceleration
  int movementTime;// moves enemy over time
  // enemy collision //
  int enemyWidth = 80; // width for the enemy collider
  int enemyHeight = 80; // height for the enemy collider
  // enemy health variables //
  int health; // enemy health value
  boolean active = false; // checks if the enemy is on screen
  // enemy explosion //
  boolean explodeFin = false; // boolean to checks if the animation finished
  int explodeTimer = 30; // timer for explosion
  //enemy constructor
  Enemy(float posX,float posY, int hp, int spawn,int type){
    position.x = posX; // sets the x pos for the enemy
    position.y = posY; // sets the y pos for the enemy
    health = hp; //sets the enemy health
    spawnTime = spawn; // determines when the enemy spawns
    movementType = type; // determines the type of movement the enemies takje
     // initalizes the sound //
    damagedSFX = new SoundFile(ObjectOrientedGame.this, "damage.wav");
    explodeSFX = new SoundFile(ObjectOrientedGame.this, "explode.wav");
  }
  // display for the enemy character
  void enemyDisplay(){
    // checks if the enemy is alive
    if(health > 0){
      image(enemyImage,position.x,position.y,enemyWidth,enemyHeight); // image for the enemy
    }
    else{
      image(explosionImage,position.x,position.y,70,70); // image for the explosion
    }
  }
  // detects enemy collision
  void enemyCollision(Bullet bullet){
    // checks if a bullet enters the enemys collision box
    if(bullet.position.x >= position.x &&
       bullet.position.x <= position.x + enemyWidth &&
       bullet.position.y >= position.y &&
       bullet.position.y <= position.y + enemyHeight ){
      damagedSFX.play();
      health -= 1; // reduces the enemy health
      if(health == 0){
        explodeSFX.play();
      }
      bullet.bulletDead = true; // turns bullet off 
    }
  }
  
  // movement code for the enemy 
  void enemyMovement(){
    movementTime += 1;
    // checks if the player is alive
    if(health > 0){
      // decideds type of movement //
      if(movementType == 2){
        position.y += velocity.y; // preforms calculations for the y to change pos
        velocity.y += acceleration.y; // preforms calculations for the y to change vel
        //if enemy touches bottom, flip position
        if(position.y >= height - 100){
          acceleration.y = -0.03;
          velocity.y = -0.3;

        }
        //if enemy touches top, flip position
        if(position.y <= 0 + 100){
          acceleration.y = 0.03;
          velocity.y = 0.3;
        }
        position.x -= 1; // moves the player forward
      }
      if(movementType == 1){
        position.y = (sin(movementTime * 0.02) * 300) + 300; // moves enemy up and down along an arc
        position.x -= 4; // moves the player forward
      }
      else{
    position.x -= 3; // moves the player normally
      }
    }
  }
}
