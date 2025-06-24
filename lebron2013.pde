Table table;
import processing.pdf.*;

void setup() {
  beginRecord(PDF, "lebron2013.pdf");
  //size of court in feet x10
  size(500, 470);
  background(0);
  
  //Derrick Rose's MVP year
  table = loadTable("NBA_2013_Shots.csv", "header");
}


void plotShots(){
  
  for (TableRow row : table.rows()) {
    String name = row.getString("PLAYER_NAME");
    String make = row.getString("SHOT_MADE");
    
    //Getting Lebron James made shots
    if (name.equals("LeBron James") && make.equals("TRUE")) {
    
      float xloc = row.getFloat("LOC_X");
      float yloc = row.getFloat("LOC_Y");
      
    //Converting coordinates to positive values and sizing properly
      float x = (xloc*10)+250;
      float y = (yloc*10);
      
      //flipping Y axis so data set has correct coordinates
      float flippedY = 470 - y;
      
      //23.75 feet is the distance of a 3PT shot. 2PT is Red, 3PT is Green 

      noStroke();
      ellipse(x, flippedY, 5, 5);
    }
  }
}



//Drawing the basketball court that is behind the data
void draw() {
//Team colour banner
  fill(0);
  rectMode(CORNERS);
  rect(00,00,500, 15);
  
  //Left corner
  stroke(255);
  line(30, 330, 30, 470);
  //right corner
  stroke(255);
  line(470, 470, 470, 330);
  
  //Need top curve of 3 pointer
  fill(0);
  stroke(255);
  arc(250, 338, 440, 295, -PI, 0);
  
  //Circle on key
  fill(0);
  ellipseMode(CENTER);
  ellipse(250, 280, 120, 120);
  
  //Key
  fill(0);
  rectMode(CORNERS);       
  rect(170, 470, 330, 280);

  //Backboard and hoop
  stroke(255);
  line(220, 428, 280, 428);
  ellipseMode(CENTER);
  ellipse(250, 415, 20, 20);
  
  //Baseline
  stroke(255);
  line(00, 470, 500, 470);
  
  
  //calling shot function
  fill(251, 128, 0);
  plotShots();
  endRecord();
}
