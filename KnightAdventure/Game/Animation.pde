class Animation {
  PImage[] frames;
  int frameIndex;
  int frameChangeInterval;
  int lastFrameChangeTime;

  Animation(PImage[] frames, int frameChangeInterval) {
    this.frames = frames;
    this.frameChangeInterval = frameChangeInterval;
    this.frameIndex = 0;
    this.lastFrameChangeTime = millis();
  }

  void update() {
    if (millis() - lastFrameChangeTime > frameChangeInterval) {
      frameIndex = (frameIndex + 1) % frames.length;
      lastFrameChangeTime = millis();
    }
  }

  PImage getCurrentFrame() {
    return frames[frameIndex];
  }
}
