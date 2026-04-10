void setup() {
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
  noStroke();
}

void draw() {
  if (frameCount % 300 == 0) {
    background(0);
  }
  float xMean = 0;
  float xStandardDeviation = 120;
  float x = randomGaussian() * xStandardDeviation + xMean;

  float y = random(-height/2.0, height/2.0);

  float sizeMean = 25;
  float sizeStandardDeviation = 10;
  float splatSize = randomGaussian() * sizeStandardDeviation + sizeMean;

  float r = random(0, 256);
  float g = random(0, 256);
  float b = random(0, 256);
  float a = random(10, 101);

  fill(r, g, b, a);
  circle(x, y, splatSize);
}
