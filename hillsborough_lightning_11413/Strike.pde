class Strike {
  float branches, segmentsX, xPos1, xPos2, yPos1, yPos2;

  Strike(float _branches) {
    xPos1 = random(width/4, 3*width/4);
    xPos2 = xPos1 + random(0, 10);
    yPos1 = 0;
    yPos2 = 5;
    branches = _branches;
  }

  void display() {
    int dir = 1;
    int dir2 = 1;
    float xoff = 0;
    float yoff = 10000;

// FIRST BRANCH

    for (int i = int(branches); i > 0; i--) {
      float randX = dir*random(0, 40)*noise(xoff);
      float noiseY = random(0, 40)*noise(yoff);
      float str = constrain(.1 + .025*i,0,2);
      strokeWeight(str);
      stroke(255, 255, 200);
      line(xPos1, yPos1, xPos2, yPos2);
      xPos1 = xPos2;
      yPos1 = yPos2;
      xPos2 = xPos2+randX;
      yPos2 = yPos2+noiseY;
      xoff+=1;
      yoff+=1;

// SECOND BRANCH

      if (abs(xPos2 - xPos1) > 20) { 
        dir = -dir;
        float bxPos1 = xPos1;
        float bxPos2 = bxPos1+random(-4, 4);
        float byPos1 = yPos1;
        float byPos2 = byPos1+5*noise(yoff);

        for (int c = 0; c < int(branches*.8); c++) {
          float str1 = constrain(.1 + .025*i - c*.04,0,1);
          stroke(255, 255, 200);
          if (str1<.025) { 
            noStroke();
          }
          else {
            strokeWeight(str1);
          }
          line(bxPos1, byPos1, bxPos2, byPos2);

          bxPos1 = bxPos2;
          byPos1 = byPos2;
          bxPos2 = bxPos2+c*random(0, 1)*dir;
          byPos2 = byPos2+c*noise(yoff);
          yoff++;

// THIRD BRANCH
          
          if (abs(bxPos2 - bxPos1) > 20) { 
            dir = -dir;
            float cxPos1 = bxPos1;
            float cxPos2 = cxPos1+random(-4, 4);
            float cyPos1 = byPos1;
            float cyPos2 = cyPos1+5*noise(yoff);

            for (int d = 0; d < int(branches*.7); d++) {
              float stro = constrain(.1 + .025*i - c*.05-d*.03,0,.75);
              stroke(255, 255, 200);
              if (stro<.01) { 
                noStroke();
              }
              else {
                strokeWeight(stro);
              }
              line(cxPos1, cyPos1, cxPos2, cyPos2);

              cxPos1 = cxPos2;
              cyPos1 = cyPos2;
              cxPos2 = cxPos2+d*random(0, 1)*dir;
              cyPos2 = cyPos2+d*noise(yoff);
              yoff++;
            }
          }
        }
      }
    }
  }
}

