ArrayList<Walker> walkers;

//PVector pushForce = new PVector(0.2,0); // Now Using push in draw()

int walkerCount = 8;

void setup(){
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  initializeWalkers();
}


void draw(){
  background(80);
  
  for (Walker w : walkers) {
    PVector push = new PVector(0.02 * w.mass, 0); 
    w.applyForce(push);
    w.applyFriction();
    w.update();
    w.render();
  }
  
  fill(0);
  stroke(0);
  line(0, Window.h, 0, -Window.h);
}

void mousePressed(){
  initializeWalkers();
}

void initializeWalkers(){
  walkers = new ArrayList<Walker>();
  
  for (int i = 0; i < walkerCount; i++) {
    Walker w = new Walker();
    float n = i + 1;
    float posY = 2 * (Window.h / (float)walkerCount) * (n - (walkerCount / 2.0));
    w.position = new PVector(Window.left + 50, posY-50);
    w.mass = i + 1;
    w.scale = w.mass * 15;
    w.c = color(random(255), random(255), random(255));
    
    walkers.add(w);
  }
}
