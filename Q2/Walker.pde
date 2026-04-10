class Walker {
  float x;
  float y;
  
  void render(){
    fill(
      random(0, 256),
      random(0, 256),
      random(0, 256),
      random(50, 101)
    );
    noStroke();
    circle(x,y,30); 
  }
  
  void randomWalk(){
    int rng = int(random(8));
    if (rng == 0) y += 10;
    else if (rng == 1) y -= 10;
    else if (rng == 2) x += 10;
    else if (rng == 3) x -= 10;
    else if (rng == 4) { x -= 10; y += 10; }
    else if (rng == 5) { x -= 10; y -= 10; }
    else if (rng == 6) { x += 10; y += 10; }
    else if (rng == 7) { x += 10; y -= 10; }
  }
  
  void randomWalkBiased(){
    float rng = random(1);

    if (rng < 0.40) {
      x += 10;   // 40% right
    } 
    else if (rng < 0.60) {
      x -= 10;   // 20% left
    } 
    else if (rng < 0.80) {
      y -= 10;   // 20% up
    } 
    else {
      y += 10;   // 20% down
    }
  }
}
