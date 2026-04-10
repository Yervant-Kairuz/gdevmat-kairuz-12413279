color white = color (255, 255, 255);
color red = color (255, 0, 0);
color green = color (0, 255, 0);
color blue = color (0, 0, 255);
color yellow = color (255, 255, 0);
color purple = color (128, 0, 128);
color cyan = color(0, 255, 255);


// Function that gets called at first frame
void setup(){
  size(1280, 720, P3D); // Sets Window Size to 1280x720
  camera(0,0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void drawCartesianPlane(){
  int size = 300;
  strokeWeight(1);
  color white = color(255,255,255);
  fill(white);
  stroke(white);
  line(size,0,-size,0);
  line(0,size,0,-size);
  
  for (int i = -size; i <=size; i += 10) {
    line(i, -5, i, 5);
    line(-5, i, -5, i);
  } 
}

void drawLinearFunction() {
  /*
    f(x) = x + 2
    Let x be 4, then y = 6   (4,6);
    Let x be -5, then y= -3  (-5, -3); 
  */
  
  fill(red);
  noStroke();
  
  for (int x = -200; x <= 200; x++){
    circle(x, x + 2, 5);
  }
}

void drawQuadraticFunction() {
   /*
    f(x) = x^2 + 2x - 5;
    Let x be 2, then y = 3
    Let x be -1, then y= -6
  */
  
  fill(green);
  stroke(green);
  noStroke();
  
  for (float x = -300; x <= 300; x+=0.1f) {
    circle(x, ((float)Math.pow(x,2) + (x * 2) - 5), 5);
  }
}

void drawCircle(){
  fill(blue);
  stroke(blue);
  float radius = 50;
  for (int x = 0; x <= 360; x++) {
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5); 
  }
}

void drawQ1N1(){
  /*
    f(x) = x^2 - 15x - 3
  */
  fill(yellow);
  stroke(yellow);
  noStroke();
  
  for (float x = -300; x <= 300; x+=0.1f) {
    circle(x, ((float)Math.pow(x,2) - (x * 15) - 3), 5);
  }
}

void drawQ1N2(){
  /*
    f(x) = -5x + 30
  */
  
  fill(purple);
  noStroke();
  
  for (int x = -300; x <= 300; x++){
    circle(x, (-5 * x) + 30, 5);
  }
}

void drawSineWave() {
  fill(cyan);
  noStroke();

  float amplitude = 50;
  float frequency = 0.05;
  float phase = frameCount * 0.05;

  for (float x = -300; x <= 300; x += 1) {
    float y = sin(x * frequency + phase) * amplitude;
    circle(x, y, 5);
  }
}

// Called Every Frame
void draw(){
  background(0); // Sets background color of whole window
  
  drawCartesianPlane();
  drawQ1N1();
  drawQ1N2();
  drawSineWave();
}
