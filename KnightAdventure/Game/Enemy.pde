class Enemy {
  float speed;
  float xl;
  float yl;
  int radius;
  float rowNumber;
  float rowSize;
  PImage[] frames;
  Animation animation;

  Enemy(float speed, int radius, int rowNumber) {
    this.speed = speed;
    this.radius = radius;
    this.rowNumber = rowNumber;
    this.rowSize = height / rowNumber;
    this.frames = new PImage[3];
    this.frames[0] = loadImage(BAT0);
    this.frames[1] = loadImage(BAT1);
    this.frames[2] = loadImage(BAT2);
    this.animation = new Animation(frames, 100);
  }

  void move() {
    xl += speed + slow;
  }

  void respawn() {
    xl = int(int(random(0, width / rowSize)) * rowSize) + width;
    yl = int(int(random(1, rowNumber + 1)) * rowSize - rowSize / 2);
  }

  void collide() {
    if (dist(xp, yp, xl, yl) < this.radius + radius) {
      player.alive = false;
    }
  }

  void teleport() {
    if (xl < -radius) {
      respawn();
    }
  }

  void display() {
    image(animation.getCurrentFrame(), xl - radius, yl - radius, radius * 2, radius * 2);
  }

  void run() {
    move();
    teleport();
    display();
    collide();
  }
}
