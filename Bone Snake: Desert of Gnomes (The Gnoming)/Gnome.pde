// Gnomes
class Enemy {
  int x, y;
  PImage enemyImage;

  Enemy() {
    place(); // Place the gnome at a random position
    enemyImage = loadImage("gnome.png"); // Load the gnome image
  }

  void place() { // Add new gnome at random position on the canvas
    x = int(random(cols));
    y = int(random(rows));
  }

  void draw() {
    imageMode(CORNER); // Set image mode to CORNER
    image(enemyImage, x * resolution, y * resolution); // Draw gnome
  }
}
