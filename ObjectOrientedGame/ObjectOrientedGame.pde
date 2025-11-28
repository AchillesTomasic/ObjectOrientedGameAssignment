// Object Varibles //
Player player = new Player(); // initalizes the player

void setup(){
  size(1700,1000); // sets the screen size

}

void draw(){
  background(255);
  playerFunctionCall();
}

// calls all the player related functions //
void playerFunctionCall()
{
 player.playerDisplay(); // displays the player on the screen
 player.playerMovement(); // preforms the movement for the player
}

// calls input when pressed or over time when held down //
void keyPressed(){
  // chekcs first if the key is coded //
  if(key == CODED){
    // input when right arrow is clicked //
    if(keyCode == RIGHT)
    {
       player.inputs[0] = true; // Sets right to true
    }
    // input when left arrow is clicked //
    if(keyCode == LEFT)
    {
       player.inputs[1] = true; // Sets left to false
    }
    // input when up arrow is clicked //
    if(keyCode == UP)
    {
       player.inputs[2] = true; // Sets up to false
    }
    // input when down arrow is clicked //
    if(keyCode == DOWN)
    {
       player.inputs[3] = true; // Sets down to false
    }

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
}
