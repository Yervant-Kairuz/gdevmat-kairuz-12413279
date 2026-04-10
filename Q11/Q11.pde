ArrayList<Walker> walkers = new ArrayList<Walker>();

void setup(){
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  int count = 10;
  for (int i = 0; i < count; i++){
    Walker w = new Walker();
    w.position = new PVector(
      random(Window.left+50, Window.right-50),
      random(Window.bottom+50, Window.top-50)
    );
    w.mass = random(5, 20);
    w.scale = w.mass * 4;
    w.c = color(random(255), random(255), random(255));

    walkers.add(w);
  }
  
}

void draw(){
  background(255);

  // apply attraction between every pair
  for (int i = 0; i < walkers.size(); i++) {
    Walker a = walkers.get(i);

    for (int j = 0; j < walkers.size(); j++) {
      if (i != j) {
        Walker b = walkers.get(j);
        a.applyForce(b.calculateAttraction(a));
      }
    }
  }

  // update and render after forces
  for (Walker w : walkers) {
    w.update();
    w.render();
  }
}
