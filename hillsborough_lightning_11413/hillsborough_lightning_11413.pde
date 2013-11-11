String lines[];
String [][] csvLightning;
Strike bolt;
int csvWidth=0;
int counter=2949;
float volume=100;
int dir = 1;
ArrayList<Raindrop> raindrops;
PFont f;

void setup() {
  size(1280, 720);
  f = createFont("Courier", 16, true); // Arial, 16 point, anti-aliasing on
  lines = loadStrings("swdireport-FL-Hillsborough-BETA.csv");

  for (int i=0; i < lines.length; i++) {
    String [] chars=split(lines[i], ',');
    if (chars.length>csvWidth) {
      csvWidth=chars.length;
    }

    raindrops = new ArrayList<Raindrop>();
    for (int f = 0; f < 2000; f++) {
      raindrops.add(new Raindrop(random(0, width), random(0, height)));
    }
  }

  csvLightning = new String [lines.length][csvWidth];

  //parse values into 2d array
  for (int i=0; i < lines.length; i++) {
    String [] temp = new String [lines.length];
    temp= split(lines[i], ',');
    for (int j=0; j < temp.length; j++) {
      csvLightning[i][j]=temp[j];
    }
  }
}

void draw() {
  background(0);

  // DRAW RAINDROPS
  for (Raindrop r : raindrops)
  {

    PVector wind = new PVector(0.05*dir, 0);
    PVector gravity = new PVector(0, 0.1*r.mass);

    r.applyForce(gravity);
    r.applyForce(wind);

    r.update();
    r.display(volume);
    r.checkEdges();
    if (volume > 100) dir = -dir;
  }

  // DRAW LIGHTNING
  if (counter < csvLightning.length) {
    String v = csvLightning[counter][1];
    String date = csvLightning[counter][0];
    volume = constrain(map(int(v), 0, 2000, 0, 200),0,180);
    bolt = new Strike(volume);
    bolt.display();
    textFont(f);
    fill(255);
    text("Hillsborough County, FL: " + date, width/12, 9*height/10);
    counter++;
  }
  else {
    counter = 0;
  }
}

