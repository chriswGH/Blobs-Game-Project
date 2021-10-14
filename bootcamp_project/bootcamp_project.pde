Blob blob;

ArrayList<Blob> blobs;
float zoom = 1;                                  //default zoom level (the amount the person can see).

void setup() {
  size(600, 600);
  blob = new Blob(0, 0, 64);                     //player's blob.
  blobs = new ArrayList<Blob>();                 //the "other" blobs.
  for (int i = 0; i < 200; i++) {                //loops and gives the "other" blobs different x and y positions.
    float x = random(-width, width);
    float y = random(-height, height);
    blobs.add(new Blob(x, y, 16));
  }
}

void draw() {
  background(233,233,233);

  translate(width/2, height/2);
  float newZoom = 64 / blob.radius;              //new variable used to update zoom level 60times per draw() according to the player's blob's current radius by the radius of the "other" blob which the player's blob has eaten.   
  zoom = lerp(zoom, newZoom, 0.1);               //then zoom level is updated using lerp() to ease the transition of the zooming.
  scale(zoom);                                   //scales using the zoom level, allowing the follwoing translate() function to be centered).
  translate(-blob.position.x, -blob.position.y);
 
  for (int i = blobs.size()-1; i >=0; i--) {     //
    blobs.get(i).display();                      //displays specific blob.
    if (blob.eatBlob(blobs.get(i))) {            //checks if the player's blob has eaten the specific "other" blob (done 60times per draw()).
      blobs.remove(i);                           //if true, the blob that is eaten is removed.
      //add x number of blobs for every one blob that is eaten.
    }
  }


  blob.display();
  blob.update();
}
