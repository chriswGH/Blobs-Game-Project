class Blob {
  PVector position;
  PVector velocity;
  float radius;
  float posX;
  float posY;
  color colour;

  Blob(float posX, float posY, float r) {
    position = new PVector(posX, posY);
    velocity = new PVector(0, 0);                                            //default speed of the player's blob, "other" blobs are static
    radius = r;
    colour = color(random(0,255),random(0,255),random(0,255));
  }

  void update() {
    PVector newV = new PVector(mouseX-width/2, mouseY-height/2);             //updates the velocity depending on mouse position.
    newV.setMag(2);
    velocity.lerp(newV, 0.2);                                                //sets velocity between the value of the new velocity and 0.4).
    position.add(velocity);
  }

  boolean eatBlob(Blob other) {
    float distance = PVector.dist(position, other.position);                 //calculates the distance between the player's blob and the "other" blobs.
    if (distance < radius + other.radius) {                                         //checks whether the player's blob is larger than the "other" blob which the player's blob collides with.
      float s = (PI * radius * radius) + (PI * other.radius * other.radius); //adds up the radii and ↓
      radius = sqrt(s/PI);                                                   //this increases the player's blob by the calculated radius (size) of the blob that was eaten.
      return true;                                                           //will do the above IF the player's blob is
    } else {
      return false;
    }
  }


  void display() {
    noStroke();
    fill(colour);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
}
