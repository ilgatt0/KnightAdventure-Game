class Sprite {
  PImage texture;
  int width;
  int height;
  PVector position;
  
  Sprite(String path, int width, int height) {
    this.width = width;
    this.height = height;
    position = new PVector();
    texture = loadImage(path);
  }
  
  void draw() {
    image(texture, position.x, position.y, width, height);
  }
}
