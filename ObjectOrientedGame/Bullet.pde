class Bullet
{
  // bullet movement variables //
   PVector position = new PVector(); // initalizes the position vectors for the bullet
    PVector velocity = new PVector(); // initalizes the velocity vectors for the bullet
    PVector acceleration = new PVector(); // initalizes the accleration vectors for the bullet
    float moveSpeed = 10;// initalizes speed of the bullet
  
  Bullet(int posX,int posY){
    position.x = posX; // sets the inital x pos for the bullet
    position.y = posY; // sets the inital y pos for the bullet
  }
  
  // displays the bullet visuals
  void displayBullet()
  {
    
  }
  // alters the movement of the bullet
  void bulletMovement(){
    position.x += moveSpeed; // moves the bullet temporary
  }
  
}
