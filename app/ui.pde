class UI {
  
  private class Button {
    private int x;
    private int y;
    private String label;
    private String image;
    
    Button(int x, int y, String label, String image) {
      this.x = x;
      this.y = y;
      this.label = label;
      this.image = image;
    }
  }

  private final float keypadHeightPercent = 100;
  private int buttonWidth = 0;
  private int buttonHeight = 0;
  private int maxRow = 0;
  private int maxCol = 0;
  
  private ArrayList<Button> buttons = new ArrayList<Button>();
  
  public UI() {
    background(0);
    buttons.add(new Button(0, 0, "onOff",   "ic_power_settings_new"));
    buttons.add(new Button(0, 1, "volUp",   "ic_volume_up"));
    buttons.add(new Button(0, 2, "volDown", "ic_volume_down"));
    buttons.add(new Button(0, 3, "audio",   "ic_input"));
    setupKeypad();
  }
    
  private int buttonX(Button b) {
    return buttonWidth * b.x;
  }

  private int buttonY(Button b) {
    return height - buttonHeight * (maxRow - b.y + 1);
  }
    
  private void setupKeypad() {
    for (Button b: buttons) {
      maxRow = Math.max(maxRow, b.y);
      maxCol = Math.max(maxCol, b.x);
    }
    buttonWidth = width / (maxCol + 1);
    buttonHeight = Math.round(height / (maxRow + 1) * keypadHeightPercent / 100.0);

    imageMode(CENTER);
    for (Button b: buttons) {
       image(loadImage(b.image + ".png"), buttonX(b) + buttonWidth / 2, buttonY(b) + buttonHeight / 2);
    }
  }
  
  public String getKey() {
    for (Button b: buttons) {
      if (mouseX > buttonX(b) && 
          mouseX < buttonX(b) + buttonWidth &&
          mouseY > buttonY(b) && 
          mouseY < buttonY(b) + buttonHeight) {    
        return b.label;
      }
    }
    return "";
  }

}
