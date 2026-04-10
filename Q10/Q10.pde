Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
ArrayList<Walker> walkers = new ArrayList<Walker>();

int count = 10;

void setup(){
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  float spacing = Window.windowWidth / (count + 1.0f);
  
  for (int i = 0; i < count; i++) {
    Walker w = new Walker();

    float x = Window.left + spacing * (i + 1);
    float y = Window.top - 50;

    w.position = new PVector(x, y);
    w.velocity = new PVector(0, 0);
    w.acceleration = new PVector(0, 0);

    w.mass = random(1.0f, 6.0f);
    w.scale = w.mass * 15.0f;
    w.c = color(random(255), random(255), random(255));

    walkers.add(w);
  }
}

void draw(){
  background(255);
  ocean.render();
  for (Walker w : walkers) {
    PVector wind = new PVector(0.1f, 0);
    PVector gravity = new PVector(0, -0.15f * w.mass);

    w.applyForce(gravity);

    if (ocean.isCollidingWith(w)) {
      PVector drag = ocean.calculateDragForce(w);
      w.applyForce(drag);
    } else { w.applyForce(wind); }

    w.update();
    w.render();

    if (w.position.y <= Window.bottom) {
      w.position.y = Window.bottom;
      w.velocity.y *= -0.9f;
    }
  }
}
