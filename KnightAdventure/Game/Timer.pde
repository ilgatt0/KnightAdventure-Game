class Timer{
  int delay;
  int elapsed;
  int incr;
  
  Timer(int delay){
    this.delay = delay;
    elapsed = 0;
    incr = 1000 / FRAME_RATE;
  }
  
  void reset(){
    elapsed = 0;
  }
  
  void update(){
    if(elapsed < delay){
      elapsed += incr;
    }
  }
  
  boolean tick(){
    if(elapsed >= delay){
      elapsed = 0;
      return true;
    }
      return false;
  }
}
