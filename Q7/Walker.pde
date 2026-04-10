public class Walker{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  public Walker() {
    position = new PVector(random(-width/2, width/2), random(-height/2, height/2));
    scale = random(10, 50);
  }
  
  public void update() {
    PVector mouse = new PVector(mouseX - width / 2, -(mouseY - height / 2));

    PVector direction = PVector.sub(mouse, this.position);
    direction.normalize();
    direction.mult(0.2);

    acceleration = direction;

    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
  }
  
  public void render() {
    fill(120);
    circle(position.x, position.y, scale);
  }
}
