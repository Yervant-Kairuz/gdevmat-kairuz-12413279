ArrayList<Walker> walkers = new ArrayList<Walker>();
int walkerAmount = 150;

void setup(){
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkerAmount; i++) {
    walkers.add(new Walker()); 
  }
}

void draw(){
  background(80);
  
  for (Walker w: walkers) {
    w.update();
    w.render();
  }
}
