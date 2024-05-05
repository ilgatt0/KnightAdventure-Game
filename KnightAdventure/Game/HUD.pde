class HUD {
  PImage texture_title;
  float textureWidth_title;
  float textureHeight_title;
  PImage texture_subT;
  float textureWidth_subT;
  float textureHeight_subT;
  PImage texture_lose;
  float textureWidth_lose;
  float textureHeight_lose;
  PImage texture_win;
  float textureWidth_win;
  float textureHeight_win;
  boolean s = true;
  Background background;
  
  HUD() {
    background = new Background(BACKGROUND, GAME_WIDTH, GAME_HEIGHT, 2);
  }
  
  void drawMenu() {
    background(25);
    texture_title = loadImage(TITLE);
    textureWidth_title = texture_title.width;
    textureHeight_title = texture_title.height;
    image(texture_title, width / 2 - textureWidth_title / 2, height / 3 - textureHeight_title - 10 / 2, textureWidth_title, textureHeight_title);
    texture_subT = loadImage(SUB_TITLE);
    textureWidth_subT = texture_subT.width;
    textureHeight_subT = texture_subT.height;
    image(texture_subT, width / 2 - textureWidth_subT / 2, height / 3 - textureHeight_subT + 60 / 2, textureWidth_subT, textureHeight_subT);
  }

  void drawGame(float playerSpeed) {
    slow = abs(AMPLITUDE * cos(TWO_PI * frameCount / PERIOD)) * 0.1;
    if (player.alive) {
      s = true;
      background.update(playerSpeed);
      background.display();
      player.control();
      player.move();
      player.walls();
      player.display();
      for (int i = 0; i < enemies.length; i++) {
        enemies[i].animation.update();
        enemies[i].run();
      }
      if (!music.isPlaying()) {
        music.loop();
      }
    } else {
      if (!player.won) {
        background(25);
        texture_lose = loadImage(LOSE_TITLE);
        textureWidth_lose = texture_lose.width;
        textureHeight_lose = texture_lose.height;
        image(texture_lose, width / 2 - textureWidth_lose / 2, height / 3 - textureHeight_lose / 2, textureWidth_lose, textureHeight_lose);
        music.stop();
        if (!loseS.isPlaying() && s) {
          loseS.play();
          s = false;
        }
      } else {
        background(25);
        texture_win = loadImage(WIN_TITLE);
        textureWidth_win = texture_win.width;
        textureHeight_win = texture_win.height;
        image(texture_win, width / 2 - textureWidth_win / 2, height / 3 - textureHeight_win / 2, textureWidth_win, textureHeight_win);
        music.stop();
        if (!wonS.isPlaying() && s) {
          wonS.play();
          s = false;
        }
      }
    }
  }

  void resetGame() {
    player.alive = true;
    player.won = false;
    for (int i = 0; i < enemies.length; i++) {
      enemies[i].respawn();
    }

    player.xs = 0;
    player.ys = 0;
    player.position.x = width * 0.2;
    player.position.y = height / 2;
  }
}
