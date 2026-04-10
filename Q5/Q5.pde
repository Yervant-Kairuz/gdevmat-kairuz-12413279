void setup(){
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker newWalker = new Walker();

void draw(){
  // flush the screen with white background
  background(255);
  
  newWalker.moveAndBounce();
  newWalker.render();
}
