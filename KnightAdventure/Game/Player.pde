class Player extends Sprite {
  float xs = 0;
  float ys = 0;
  int horiz = 5;
  float r = 0.98;
  int jump = 7;
  float gravity = 0.4;
  int radius = 20;
  boolean isJumping = false;
  boolean isFalling = false;
  boolean alive = true;
  boolean won = false;
  PImage texturePlayer, textureJump, textureFall;
  Key up;
  Key down;
  Key left;
  Key right;

  Player(String path, int width, int height, String jumpPath, String fallPath) {
    super(path, width, height);
    texturePlayer = loadImage(path);
    textureJump = loadImage(jumpPath);
    textureFall = loadImage(fallPath);
    up = new Key('w');
    down = new Key('s');
    left = new Key('a');
    right = new Key('d');
  }

  void control() {
    if (keyPressed) {
      if (right.pressed) {
        xs = horiz;
      }
      if (left.pressed) {
        xs = -horiz;
      }
      if (up.pressed) {
        ys = -jump;
      }
      if (down.pressed) {
        ys += jump / 2;
      }
    }
  }

  void move() {
    position.x += xs;
    position.y += ys;
    
    xp = position.x;
    yp = position.y;

    isJumping = ys < 0;
    isFalling = ys > 1;

    ys += gravity;
    xs *= r;
  }

  void display() {
    if (isJumping) {
      texture = textureJump;
    } else if (isFalling) {
      texture = textureFall;
    } else {
      if (abs(xs) > 0.1) {
        texture = texturePlayer;
      } else {
        texture = texturePlayer;
      }
    }

    image(texture, position.x - radius, position.y - radius, radius * 2, radius * 2);
  }
  
  void walls() {
    if(position.y - radius <= 0){
      position.y = radius + 1;
      ys = -ys * (r / 2);
    }
    if (position.y + radius >= GAME_HEIGHT) {
      position.y = GAME_HEIGHT - radius - 1;
      ys = 0;
      isJumping = false;
      isFalling = false;
    }
    if(position.x - radius <= 0){
      position.x = radius + 1;
      xs = -xs * (r / 2);
    }
  
    if(position.x + radius >= GAME_WIDTH){
      alive = false;
      won = true;
    }
  }

  void keyPressed(int key) {
    up.keyPressed(key);
    down.keyPressed(key);
    left.keyPressed(key);
    right.keyPressed(key);
  }

  void keyReleased(int key) {
    up.keyReleased(key);
    down.keyReleased(key);
    left.keyReleased(key);
    right.keyReleased(key);
  }
}
