/**
 * COMP570 Programming for Creativity 2023 S1
 * Assignment 1 - Animated Shapes
 * 
 * This program draws a black elipse and a rectangle on the screen
 * that change shape according to mouse movement
 * and can change color with a click
 *
 * @author Benji Gifford, ID#22182067
 * @version 1.0 - 7/03/2023: Created
 */
 
 color shapeColor = color(0); // global variable for the shape color; start "black"
 
 /**
  * Sets up the program
  */
 void setup()
 {
   size(400, 400, P2D); // deploy canvas size
 }
 
 /**
  * Draws a single frame
  */
 void draw()
 {
   // clear canvas with white
   background(255);
   // draw shapes;
   fill(shapeColor);
   ellipse(200, 100, mouseX, 200);
   rect(50, 200, 300, mouseY);
 }
 
 /**
  * Called when the user presses the mouse button,
  * which changes the shape color to white
  */
void mousePressed()
{
  shapeColor = color(255); // change shape color to white
}
