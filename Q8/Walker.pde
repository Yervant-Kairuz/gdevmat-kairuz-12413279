public class Walker{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float scale = 15;
  public float mass = 1;
  
  public color c;
  
  // Second Law of Motion
  public void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // force accumulation
  }
  
  public void update() {
    this.velocity.add(this.acceleration); // velocity accumulation
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render() {
    fill(c);
    noStroke();
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges(){
    float r = scale / 2.0;

    if (position.x + r >= Window.right){
      position.x = Window.right - r;
      velocity.x *= -1;
    } else if (position.x - r <= Window.left){
      position.x = Window.left + r;
      velocity.x *= -1;
    }

    if (position.y + r >= Window.top){
      position.y = Window.top - r;
      velocity.y *= -1;
    } else if (position.y - r <= Window.bottom){
      position.y = Window.bottom + r;
      velocity.y *= -1;
    }
  }
}
