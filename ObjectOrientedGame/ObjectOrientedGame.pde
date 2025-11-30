// Object Varibles //
Player player; // initalizes the player

void setup(){
  size(1500,750); // sets the screen size
 player = new Player(width/10, height /2.5);
}

void draw(){
  background(255);
  playerFunctionCall();
  bulletFuncitonCall();
}
// calls all the bullet funcitons for every bullet
void bulletFuncitonCall(){
  // loops over every player bullet and runs the bullet functions
  for(Bullet bullet : player.bullets){
    bullet.displayBullet(); // displays the bullets on the screen
    bullet.bulletMovement(); // preforms the movement for the bullet
  }
  player.bulletTimer -= 1; // ensures the timer is consistantly active for the player bullets
  // checks every bullet to see if it is still active
  for(int i = player.bullets.size() - 1; i > 0; i--){
    // condition checks the bullets position on screen and removes the bullet if its off screen or checks if the bullet is dead
   if(player.bullets.get(i).position.x > 1600 || player.bullets.get(i).bulletDead == true ){
     player.bullets.remove(i); // removes the bullet from the array
   }
  }
}

// calls all the player related functions //
void playerFunctionCall()
{
 player.playerDisplay(); // displays the player on the screen
 player.playerMovement(); // preforms the movement for the player
 player.collision(); // preforms the collision detection for the player
 
}

// calls input when pressed or over time when held down //
void keyPressed(){
  // chekcs first if the key is pressed //
  if(key == CODED){
    // input when right arrow is pressed //
    if(keyCode == RIGHT)
    {
       player.inputs[0] = true; // Sets right to true
    }
    // input when left arrow is pressed //
    if(keyCode == LEFT)
    {
       player.inputs[1] = true; // Sets left to true
    }
    // input when up arrow is pressed //
    if(keyCode == UP)
    {
       player.inputs[2] = true; // Sets up to true
    }
    // input when down arrow is pressed //
    if(keyCode == DOWN)
    {
       player.inputs[3] = true; // Sets down to true
    }
  }
  // input when z is pressed //
    if(key == 'z')
    {
       player.inputs[4] = true; // Sets z to true
       
    }
}

// when input is relseaed //
void keyReleased(){
  // chekcs first if the key is coded //
   if(key == CODED)
   {
      // input when right arrow is clicked //
    if(keyCode == RIGHT)
    {
       player.inputs[0] = false; // Sets right to false
    }
    // input when left arrow is clicked //
    if(keyCode == LEFT)
    {
       player.inputs[1] = false; // Sets left to false
    }
    // input when up arrow is clicked //
    if(keyCode == UP)
    {
       player.inputs[2] = false; // Sets up to false
    }
    // input when down arrow is clicked //
    if(keyCode == DOWN)
    {
       player.inputs[3] = false; // Sets down to false
    }
   }
    // input when z is pressed //
    if(key == 'z')
    {
       player.inputs[4] = false; // Sets z to false
    }
}
