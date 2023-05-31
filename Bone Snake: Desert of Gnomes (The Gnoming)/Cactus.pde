// Cactus
class Cactus {
  int x, y;

  Cactus(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    imageMode(CORNER); // Set image mode to CORNER
    image(loadImage("cactus.png"), x * resolution, y * resolution); // Draw cactus at randomly specified position
  }
}

// Add new cactus at random position on the canvas
void addCactus() {
    int newX = int(random(cols));
    int newY = int(random(rows));
    Cactus newCactus = new Cactus(newX, newY); // Create a new cactus with random coordinates
    cacti.add(newCactus);
  }
