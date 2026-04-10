void setup(){
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos(){
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw(){
  background(130);
  
  PVector mouse = mousePos();
  
  mouse.normalize().mult(250);
  
  PVector otherSide = mouse.copy().mult(-1);
  
  // Red Glow
  stroke(255, 0, 0, 120);
  strokeWeight(14);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, otherSide.x, otherSide.y);
  
  // White Glow
  stroke(255);
  strokeWeight(6);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, otherSide.x, otherSide.y);
  
  // Handle
  stroke(0);
  strokeWeight(16);
  PVector handleDir = mouse.copy().normalize().mult(30);
  PVector handleBack = handleDir.copy().mult(-1);
  line(handleBack.x, handleBack.y, handleDir.x, handleDir.y);
  
  println(mouse.mag());
}
