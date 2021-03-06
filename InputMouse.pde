
// Inputs ---------------------------

void mousePressed() {
  // analyze mouse
  // reset timer to avoid tool tip text 
  timeSinceLastMouseMoved = millis();  
  //
  switch (state) {
  case stateNormal:
    // which button?
    analyzeButton();
    break;
  case stateFileManager:
    // if file manager 
    break;
  case stateHelp:
    // return to former state 
    if (formerState>=0)
      state=formerState;
    else 
      state=stateNormal;
    break;
  default:
    println ("Error 123, tab InputMouse: "+state);
    exit();
    break;
  } // switch
} // func 

// ----------------------------------------

void mouseWheel(MouseEvent event) {
  // mousewheel 
  // only during stateFileManager
  // reset timer to avoid tool tip text 
  timeSinceLastMouseMoved = millis();  

  // scroll 
  if (state!=stateHelp && state!=stateUndefined) {
    float e = event.getAmount();
    // eval 
    if (e<0) { 
      from--;
      if (from<0)
        from = 0;
    } // if 
    else if (e>0) {
      // down 
      from++;
    } // else if
    //
  } // if
} // func

// ---------------------------------- 

void analyzeButton() {
  // for normal state 
  // which button?
  if (buttonPause.over()) {
    command( buttonPause.commandNumber );
  }
  else if (buttonProgressFrame.over()) {
    command( buttonProgressFrame.commandNumber );
  }
  else if (buttonNext.over()) {
    command( buttonNext.commandNumber );
  }
  else if (buttonPrevious.over()) {
    command( buttonPrevious.commandNumber );
  }       
  else {
    // check song list and try to go to song 
    if (showSongList==true) { 
      for (Button currentButton:buttonsList) {
        if (currentButton.over()) {
          indexFile=currentButton.commandNumber+from;
          getCurrentSong() ;
        } // if
      } // for
    } // if
  } // else 
  //
} // func 
//

void checkFolderListForStateFileManager() {
  // 
  // check folder list and try to go to folder
  indexFolder=-1; 
  for (Button currentButton:buttonsList) {
    if (currentButton.over()) {
      indexFolder=currentButton.commandNumber;
      break;
    } // if
  } // for
  // 
  if ( indexFolder>=0 && indexFolder+from<=namesFolders.length ) {
    String temp = namesFolders[indexFolder+from] ;
    println(temp); 
    File dir = new File(temp);
    temp="";
    println(dir.getAbsolutePath());
    pathGlobal = dir;
    getFolder();
    getCurrentSong();
  } // if
} // func 

void checkFolderListDrives() {
  // 
  // check folder list and try to go to folder
  indexFolder=-1; 
  for (Button currentButton:buttonsList) {
    if (currentButton.over()) {
      indexFolder=currentButton.commandNumber;
      break;
    } // if
  } // for
  // 
  if ( indexFolder>=0 && 
    indexFolder+from<=namesFolders.length ) {
    String temp = namesFolders[indexFolder+from];
    File temp2= new File ( namesFolders[indexFolder+from] );
    if (temp2.exists()) {
      File dir = new File(temp);
      temp="";
      pathGlobal = dir;
      getFolder();
      getCurrentSong();
    }
    else {
      statusMsg.statusMsg("Drive not ready. No media?");
    }
  } // if
} // func 
// 

