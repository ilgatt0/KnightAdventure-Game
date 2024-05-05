import controlP5.*;

class ControlP5Manager {
  ControlP5 cp5;
  Button playButton;
  boolean menu = true;
  boolean gameStarted = false;

  ControlP5Manager() {
    cp5 = new ControlP5(Game.this);
    playButton = cp5.addButton("play")
                     .setPosition(width/2 - 50, height - 60)
                     .setSize(100, 40)
                     .setLabel("PLAY");
    playButton.setVisible(true);
  }

  void mouseReleased(){
    if(menu && cp5.getController("play").isMouseOver()) {
      menu = false;
      gameStarted = true;
      cp5.getController("play").setVisible(false);
    } else if (!player.alive && player.won){
      hud.resetGame();
    } else if (!player.alive && !player.won){
      hud.resetGame();
    }
  }
}
