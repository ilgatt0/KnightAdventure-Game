class Background extends Sprite {
  float x;
  float speed;

  Background(String path, int width, int height, float speed) {
    super(path, width, height);
    this.speed = speed;
    x = 0;
  }

  void update(float playerSpeed) {
    x -= playerSpeed * speed;
    if (x <= -width) {
      x = 0;
    }
  }

  void display() {
    image(texture, x, 0);
    image(texture, x + width, 0);
  }
}
