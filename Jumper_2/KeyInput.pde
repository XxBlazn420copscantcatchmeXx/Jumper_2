class KeyInput {
  boolean isPressed;
  
  int keyIdentifier;
  int keyCodeIdentifier;
  
  public KeyInput(int keyIdentifier, int keyCodeIdentifier){
    this.keyIdentifier = keyIdentifier;
    this.keyCodeIdentifier = keyCodeIdentifier;
  }
  
  void keyPressed(){
    if(this.keyIdentifier == CODED && key == CODED && this.keyCodeIdentifier == keyCode){
      isPressed = true;
    }
    else if(key != CODED && key == this.keyIdentifier){
      isPressed = true;
    }
  }
  
  void keyReleased(){
    if(this.keyIdentifier == CODED && key == CODED && this.keyCodeIdentifier == keyCode){
      isPressed = false;
    }
    else if(key != CODED && key == this.keyIdentifier){
      isPressed = false;
    }
  }
}
