ArrayList<Walker> walkers = new ArrayList<Walker>();

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

int amountOfWalkers = 10;

void setup(){
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < amountOfWalkers; i++){
    Walker w = new Walker();
    w.mass = i+1;
    w.scale = w.mass*15;
    w.position = new PVector(-500, 200);
    w.c = color(random(255), random(255), random(255));
    
    walkers.add(w);
  }
}


void draw(){
  background(80);
  walkers.sort((a, b) -> Float.compare(b.mass, a.mass));
  
  for (Walker w : walkers) {
    w.applyForce(wind);
    w.applyForce(gravity);
    
    w.update();
    w.checkEdges();
    w.render();
  }
}
