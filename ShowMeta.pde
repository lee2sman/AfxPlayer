

// show meta data of a song

void showMeta() {
  //  
  // data for meta information 
  final int xs = 10;   // x start-pos
  final int ys = 115;  // y start-pos
  final int yi = 16;   // y line difference 
  //
  int y = ys;
  int i = 0;
  if (!(meta==null)) {
    setLineBkg(i++, y);
    textTab("Title: \t" + meta.title(), xs, y);
    setLineBkg(i++, y+=yi);
    textTab("Length: \t" + strFromMillis(meta.length()), xs, y);
    setLineBkg(i++, y+=yi);
    try {
      // setLineBkg(i++, y+=yi);
      // textTab("Track:   \t  " + meta.track(), xs, y+=yi);
    } 
    catch (ArrayIndexOutOfBoundsException e) { // to do ??? 
      System.err.println("Caught ArrayIndexOutOfBoundsException:      "
        +  e.getMessage());
    } 
    finally {
      // do nothing
    }; 
    // setLineBkg(i++, y+=yi);
  } // if 
} // 

void setLineBkg( int i, int y) {
  // only lines 
  noFill();
  stroke(255);
  //rect(-1, y-12, width+3, 17);
  line(-1, y-12, width+3, y-12);
  fill(255);
}

void setLineBkg2( int i, int y) {
  // rects as background for the text lines 
  // in two gray colors
  if (i%2 == 1)
    fill(25);
  else
    fill(125);
  noStroke();
  rect(-1, y-12, width+3, 17);
  fill(255);
}
// --------------------------------------------

