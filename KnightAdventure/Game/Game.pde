float xp;
float yp;
float slow;
Sound music;
Sound wonS;
Sound loseS;
Player player;
Enemy[] enemies;
ControlP5Manager cp5;
HUD hud;

void settings() {
  size(GAME_WIDTH, GAME_HEIGHT);
}

void setup(){
  windowTitle(GAME_TITLE);
  windowResizable(false);
  frameRate(FRAME_RATE);
  music = new Sound(this, CAVE_MUSIC);
  wonS = new Sound(this, WON_SOUND);
  loseS = new Sound(this, LOSE_SOUND);
  hud = new HUD();
  player = new Player(PLAYER, 20, 20, PLAYER_JUMP, PLAYER_FALL);
  player.position.x = width * 0.2;
  player.position.y = height / 2;
  enemies = new Enemy[ENEMYNUMBER];
  cp5 = new ControlP5Manager();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  noStroke();
  
  for (int i = 0; i < enemies.length; i++){
    enemies[i] = new Enemy(-18, 12, 6);
  }
}

void draw(){
  if (cp5.menu) {
    hud.drawMenu();
  } else {
    hud.drawGame(1.5);
  }
}

void keyPressed() {
  player.keyPressed(key);
}

void keyReleased() {
  player.keyReleased(key);
}

void mouseReleased(){
  cp5.mouseReleased();
}
