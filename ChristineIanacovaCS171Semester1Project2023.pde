/*
This processing project is an interactive quiz bassed on the theme of sustainable environment.
You will be able to answer multiple choice questions by clicking a,b,c, or d.
True of False questions by clicking T,or F.
and selectable answers by hovering over the text box and clicking the box.
There will also be info pages after each question, explaining the correct answer.
And optional music if you please :].
*/

//splash screen, screen setup and screen progression ideas taken from github.. FarzadR-Dev ..Processing Quiz
//i changed the key pressed function for questions and made it simpler and easier to use.
//i added the extra screen and next page button option using the same ideas.
//code for music options taken from github.. FarzadR-Dev ..Processing Quiz

//------------------------------------------------------------------------------------------------------------------------
//Sound and Audio
import ddf.minim.*; //To add sound

AudioPlayer player;//Audio will be used in the file, using Minim
Minim minim;    //code for audio taken from github.. FarzadR-Dev ..Processing Quiz

//Initial Screen and Quiz setup
PFont font; //Font used
int screen = 0; //screens
int score = 0;  //Score of player

PImage Background0; //Background on splash page
PImage image1; //info page image
PImage image2; //clickable next image to change screen
PImage mouseCursor; //image used for a custom cursor

PImage glass;    //glass image
PImage paper;    //paper image
PImage plastic;  //plastic image
PImage conveyor;

int x1 = 200, y1 = 420;  //position for glass image
int x2 = 500, y2 = 450;  //position for paper image
int x3 = 800, y3 = 450;  //position for plastic image  
int squareSize = 80; //bin size

//boolean variables used to make the images disappear when placed in correct box 
boolean displayGlass = true;  //use of boolean to make sure an image is being dragged and dropped taken from chatgpt advice
boolean displayPaper = true;
boolean displayPlastic = true; 

//boolean varibales used to make sure only one image is being dragged at once
boolean isDraggingGlass = false;
boolean isDraggingPaper = false;
boolean isDraggingPlastic = false; 

String imageGlass = "glass";  
String imagePaper = "paper";  
String imagePlastic = "plastic";


//------------------------------------------------------------------------------------------------------------------------
void setup() {
  size(1280, 720);
  Background0=loadImage("environment1.png");   //Background Image of Splash Screen
  image1=loadImage("InfoPage1.png"); //info page image
  image2=loadImage("recycling-logo-transparent-8.png"); //clickable next image to change screen
  mouseCursor = loadImage("icons8-cursor-30.png");
  glass = loadImage("glass.png");  
  paper = loadImage("paper.png");  
  plastic = loadImage("plasticrope.png");  
  conveyor = loadImage("conveyor3.png"); 

  //Font setup
  font = createFont("Crima.ttf", 32); //Font
}

//---------------------------------------------------------------------------------------------------------
void draw () {
  background(loadImage("globebackground.png")); //globe image background
  
  if(mouseX<1280)
  {
    cursor(mouseCursor);
  }

  //splash screen = 0
  if (screen == 0) {
    image(Background0, 0, 0);
    fill(0);
    rect(250, 245, 852, 50);
    fill(#D33535);
    textFont(font);
    textSize(30);
    text("Welcome to the quiz, press the space bar to start, or choose a song", 260, 280);
    fill(0);
    rect(505, 300, 100, 50);   //music choice boxes
    rect(630, 300, 100, 50);
    fill(#D33535);
    textSize(20);
    text("Moog City", 510, 335);
    text("Aria Math", 635, 335);
    
    textSize(20);
    fill(255);
    text("Christine Ianacova", 30,669);
    text("23503909", 30,700);
    

   
    if ((mousePressed == true) && (mouseX >= 505 && mouseX <= 605 && mouseY >= 00 && mouseY <= 350)) {    //Clickable answer based on cursor location
      minim = new Minim(this);
      player = minim.loadFile("06 C418 - Moog City.mp3", 2048); //Music throughout quiz
      player.play();
    }


    if ((mousePressed == true) && (mouseX >= 630 && mouseX <= 730 && mouseY >= 300 && mouseY <= 350)) {    //Clickable answer based on cursor location
      minim = new Minim(this);
      player = minim.loadFile("13 C418 - Aria Math.mp3", 2048); //Music throughout quiz
      player.play();
    }


    //move to next page
    if ((mousePressed == true) && (mouseX >= 505 && mouseX <= 605 && mouseY >= 300 && mouseY <= 350)) {
      screen++;
    }

    if ((mousePressed == true) && (mouseX >= 630 && mouseX <= 730 && mouseY >= 300 && mouseY <= 350)) {
      screen++;
    }
  }

  //SplashScreenContinue
  if (keyPressed && screen==0) {  //if space is pressed instead of music move to first question
    screen++;
  }

//---------------------------------------------------------------------------------------------------------
  //first question screen = 1
  if (screen == 1) {
    textSize(25);
    fill(96, 96, 96);
    rect(35, 80, 700, 80);
    rect(35, 270, 250, 100);
    fill(224, 224, 224);
    text("What country produced the most amount of food waste in 2020?", 45, 110);
    text("Press the corresponding key to the answer you wish to select", 45, 140);
    textSize(25);
    text("A. China", 45, 300);
    text("B. India", 45, 320);
    text("C. Russia", 45, 340);
    text("D. USA", 45, 360);

    //if correct option is selected + 1 to score
    if ((keyPressed == true) && ((key == 'a') && (screen == 1)|| (key == 'A') && (screen == 1))) {
      score++;
    }

    //move to next page
    if ((keyPressed == true) && ((key == 'a') && (screen == 1)|| (key == 'A') && (screen == 1))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'b') && (screen == 1)|| (key == 'B') && (screen == 1))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'c') && (screen == 1)|| (key == 'C') && (screen == 1))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'd') && (screen == 1)|| (key == 'D') && (screen == 1))) {
      screen++;
    }
  }

  if (screen == 2) {
    background(loadImage("InfoPage1.png"));
    textSize(30);
    fill(0);
    text("Click the recycling logo to proceed", 570, 80);
    textSize(25);
    text("China produced the most amount of food waste in 2020", 570, 140);
    text("About half of that food waste – between 17 and 18 million ", 570, 180);
    text("tonnes annually – is wasted at the final stage of the supply", 570, 220);
    text("chain: at retail or consumption, meaning that people are ", 570, 260);
    text("literally throwing ready-made and fully-cooked food.", 570, 300);

    image(image2, 845, 380, 70, 70);
    //move to next page
    if ((mousePressed == true) && (mouseX >= 845 && mouseX <= 915 && mouseY >= 380 && mouseY <= 450)) {
      screen++;
    }
  }

//---------------------------------------------------------------------------------------------------------
  //Second Question Screen
  if (screen == 3) { //code reused from first question
    textSize(25);
    fill(96);
    rect(35, 80, 770, 40);
    rect(35, 270, 100, 100);
    fill(224);
    text("2nd question, How much waste does the average person create per day?", 45, 110);
    textSize(25);
    text("A. 10kg", 45, 300);
    text("B. 2kg", 45, 320);
    text("C. 0.6kg", 45, 340);
    text("D. 5kg", 45, 360);

    //if correct option is selected + 1 to score
    if ((keyPressed == true) && ((key == 'c') && (screen == 3)|| (key == 'C') && (screen == 3))) {
      score++;
    }

    //move to next page
    if ((keyPressed == true) && ((key == 'a') && (screen == 3)|| (key == 'A') && (screen == 3))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'b') && (screen == 3)|| (key == 'B') && (screen == 3))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'c') && (screen == 3)|| (key == 'C') && (screen == 3))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'd') && (screen == 3)|| (key == 'D') && (screen == 3))) {
      screen++;
    }
  }

  if (screen == 4) { //code reused from question 1 info page
    background(loadImage("InfoPage1.png"));
    textSize(30);
    fill(0);
    text("Click the recycling logo to proceed", 570, 80);
    textSize(25);
    text("0.6kg is an approximation of how much waste the average person", 570, 140);
    text("creates per day. However all else being equal the range can be ", 570, 180);
    text("anywhere between 0.1kg to 7kg", 570, 220);

    image(image2, 1050, 360, 70, 70);
    //move to next page
    if ((mousePressed == true) && (mouseX >= 1050 && mouseX <= 1120 && mouseY >= 360 && mouseY <= 430)) {
      screen++;
    }
  }

//---------------------------------------------------------------------------------------------------------
  //Third Question Screen
  if (screen == 5) { //code reused from first question
    textSize(25);
    fill(96);
    rect(35, 80, 550, 40);
    rect(35, 270, 200, 100);
    fill(224);
    text("3rd question,Select a type of renewable energy", 45, 110);
    textSize(25);
    text("A. Coal", 45, 300);
    text("B. Oil", 45, 320);
    text("C. Nuclear", 45, 340);
    text("D. Solar", 45, 360);

    //if correct option is selected + 1 to score
    if ((keyPressed == true) && ((key == 'd') && (screen == 5)|| (key == 'D') && (screen == 5))) {
      score++;
    }

    //move to next page
    if ((keyPressed == true) && ((key == 'a') && (screen == 5)|| (key == 'A') && (screen == 5))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'b') && (screen == 5)|| (key == 'B') && (screen == 5))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'c') && (screen == 5)|| (key == 'C') && (screen == 5))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'd') && (screen == 5)|| (key == 'D') && (screen == 5))) {
      screen++;
    }
  }

  if (screen == 6) { //code reused from question 1 info page
    background(loadImage("InfoPage1.png"));
    textSize(30);
    fill(0);
    text("Click the recycling logo to proceed", 570, 80);
    textSize(25);
    text("Solar energy is the only renewable source of energy as it", 570, 140);
    text("converts sun light to energy.", 570, 180);
    text("However oil is most used globally due to its versatility and", 570, 240);
    text("energy density.", 570, 280);


    image(image2, 940, 570, 70, 70);
    //move to next page
    if ((mousePressed == true) && (mouseX >= 940 && mouseX <= 1010 && mouseY >= 570 && mouseY <= 640)) {
      screen++;
    }
  }

//---------------------------------------------------------------------------------------------------------
  //Fourth question Screen
  if (screen == 7) { ////code reused from first question
    textSize(25);
    fill(96);
    rect(35, 80, 900, 40);
    rect(35, 270, 220, 100);
    fill(225);
    text("4th question,What should be the preferred method for disposing electronic waste? ", 45, 110);
    textSize(25);
    text("A. Landfill disposal", 45, 300);
    text("B. Incineration", 45, 320);
    text("C. Recycling", 45, 340);
    text("D. Ocean dumping", 45, 360);
    
    
    //if correct option is selected + 1 to score
    if ((keyPressed == true) && ((key == 'c') && (screen == 7)|| (key == 'C') && (screen == 7))) {
      score++;
    }

    //move to next page
    if ((keyPressed == true) && ((key == 'a') && (screen == 7)|| (key == 'A') && (screen == 7))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'b') && (screen == 7)|| (key == 'B') && (screen == 7))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'c') && (screen == 7)|| (key == 'C') && (screen == 7))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'd') && (screen == 7)|| (key == 'D') && (screen == 7))) {
      screen++;
    }
  }

  if (screen == 8) { //code reused from question 1 info page
    background(loadImage("InfoPage1.png"));
    textSize(30);
    fill(0);
    text("Click the recycling logo to proceed", 570, 80);
    textSize(25);
    text("Recycling is the only environmental sustainable method of", 570, 140);
    text("disposal as it reduces the amount of waste going to land fill .", 570, 180);
    text("or burned .Whereas dumping on land and ocean only piles waste", 570, 240);
    text(" on top of waste, and incineration pollutes the air and contributes ", 570, 280);
    text("to global warming.", 570, 320);

    image(image2, 610, 570, 70, 70);
    //move to next page
    if ((mousePressed == true) && (mouseX >= 610 && mouseX <= 680 && mouseY >= 570 && mouseY <= 640)) {
      screen++;
    }
  }

//---------------------------------------------------------------------------------------------------------
  //Fifth Question Screen
  if (screen == 9) { //code reused from first question
    textSize(25);
    fill(96);
    rect(35, 80, 720, 85);
    rect(35, 270, 210, 100);
    fill(224);
    text("5th question, Which mode of transportation is considered the most", 45, 110);
    text("environmentally friendly in terms of reducing carbon emissions? ", 45, 140);
    textSize(25);
    text("A. Cars", 45, 300);
    text("B. Bicycles", 45, 320);
    text("C. Airplanes", 45, 340);
    text("D. Eletric scooters", 45, 360);
    

    //if correct option is selected + 1 to score
    if ((keyPressed == true) && ((key == 'b') && (screen == 9)|| (key == 'B') && (screen == 9))) {
      score++;
    }

    //move to next page
    if ((keyPressed == true) && ((key == 'a') && (screen == 9)|| (key == 'A') && (screen == 9))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'b') && (screen == 9)|| (key == 'B') && (screen == 9))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'c') && (screen == 9)|| (key == 'C') && (screen == 9))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'd') && (screen == 9)|| (key == 'D') && (screen == 9))) {
      screen++;
    }
  }

  if (screen == 10) { //code reused from question 1 info page
    background(loadImage("InfoPage1.png"));
    textSize(30);
    fill(0);
    text("Click the recycling logo to proceed", 570, 80);
    textSize(25);
    text("Bicycles are the only environmentally sustainable friendly", 570, 140);
    text("method of transportaion as they produce no fossil fuels ", 570, 180);
    text("Next would be public transport as it reduces the amount of individual", 570, 220);
    text("cars on the road.", 570, 260);

    image(image2, 710, 460, 70, 70);
    //move to next page
    if ((mousePressed == true) && (mouseX >= 710 && mouseX <= 780 && mouseY >= 460 && mouseY <= 530)) {
      screen++;
    }
  }

//---------------------------------------------------------------------------------------------------------
  //Sixth Question Screen
  if (screen == 11) { //code reused from first question
    textSize(25);
    fill(96);
    rect(35, 80, 720, 85);
    rect(35, 270, 100, 70);
    fill(224);
    text("6th question (true or false),High income countries generate about", 45, 110);
    text("34% or 683 million tonnes of the worlds waste.", 45, 140);
    textSize(25);
    text("T. True", 45, 300);
    text("F. False", 45, 320);
    

    //if correct option is selected + 1 to score
    if ((keyPressed == true) && ((key == 't') && (screen == 11)|| (key == 'T') && (screen == 11))) {
      score++;
    }

    //move to next page
    if ((keyPressed == true) && ((key == 't') && (screen == 11)|| (key == 'T') && (screen == 11))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'f') && (screen == 11)|| (key == 'F') && (screen == 11))) {
      screen++;
    }
  }

  if (screen == 12) { //code reused from question 1 info page
    background(loadImage("InfoPage1.png"));
    textSize(30);
    fill(0);
    text("Click the recycling logo to proceed", 570, 80);
    textSize(25);
    text("True! High-income countries often have higher levels of", 570, 140);
    text("consumption and production. The lifestyle and consumption ", 570, 180);
    text("habits in these countries often lead to the creation of ", 570, 220);
    text("more waste. This can include packaging waste, electronic ", 570, 260);
    text("waste, and disposable goods.", 570, 300);

    image(image2, 1050, 460, 70, 70);
    //move to next page
    if ((mousePressed == true) && (mouseX >= 1050 && mouseX <= 1120 && mouseY >= 460 && mouseY <= 530)) {
      screen++;
    }
  }
  
  //---------------------------------------------------------------------------------------------------------
  //Seventh Question Screen
  if (screen == 13) { //code reused from first question
    textSize(25);
    fill(96);
    rect(35, 80, 750, 110);
    rect(35, 270, 170, 70);
    fill(224);
    text("7th question,According to UNICEF and the World Health Organization,", 45, 110);
    text("as of 2019, 2.2 billion people worldwide lack access to safely managed", 45, 140);
    text("drinking water services.", 45, 170);
    textSize(25);
    text("T. True", 45, 300);
    text("F. False", 45, 320);
    

    //if correct option is selected + 1 to score
    if ((keyPressed == true) && ((key == 't') && (screen == 13)|| (key == 'T') && (screen == 13))) {
      score++;
    }

    //move to next page
    if ((keyPressed == true) && ((key == 't') && (screen == 13)|| (key == 'T') && (screen == 13))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'F') && (screen == 13)|| (key == 'f') && (screen == 13))) {
      screen++;
    }
  }

  if (screen == 14) { //code reused from question 1 info page
    background(loadImage("InfoPage1.png"));
    textSize(30);
    fill(0);
    text("Click the recycling logo to proceed", 570, 80);
    textSize(25);
    text("True! In many regions, especially in low-income and ", 570, 140);
    text("developing countries, there is a lack of infrastructure", 570, 180);
    text("for providing safe and reliable drinking water. This includes", 570, 220);
    text("inadequate water supply systems, distribution networks,", 570, 260);
    text("and water treatment facilities. ", 570, 300);

    image(image2, 710, 360, 70, 70);
    //move to next page
    if ((mousePressed == true) && (mouseX >= 710 && mouseX <= 780 && mouseY >= 360 && mouseY <= 430)) {
      screen++;
    }
  }

//---------------------------------------------------------------------------------------------------------
  //Eighth Question Screen
  if (screen == 15) { //code reused from first question
    textSize(25);
    fill(96);
    rect(35, 80, 750, 110);
    rect(35, 270, 170, 70);
    fill(224);
    text("8th question, The World Economic Forum estimates that transitioning", 45, 110);
    text("to a circular economy could generate a net economic benefit of", 45, 140);
    text("$4.5 trillion by 2030 and create 230,000 new jobs. ", 45, 170);
    textSize(25);
    text("T. True", 45, 300);
    text("F. False", 45, 320);
    

    //if correct option is selected + 1 to score
    if ((keyPressed == true) && ((key == 't') && (screen == 15)|| (key == 'T') && (screen == 15))) {
      score++;
    }

    //move to next page
    if ((keyPressed == true) && ((key == 't') && (screen == 15)|| (key == 'T') && (screen == 15))) {
      screen++;
    }
    if ((keyPressed == true) && ((key == 'F') && (screen == 15)|| (key == 'f') && (screen == 15))) {
      screen++;
    }
  }


  if (screen == 16) { //code reused from question 1 info page
    background(loadImage("InfoPage1.png"));
    textSize(30);
    fill(0);
    text("Click the recycling logo to proceed", 570, 80);
    textSize(25);
    text("In a circular economy, resources are used more efficiently.", 570, 140);
    text("Products are designed to be easily disassembled and recycled,", 570, 180);
    text("reducing the demand for virgin resources. This efficiency  ", 570, 220);
    text("can result in cost savings for businesses.", 570, 260);

    image(image2, 820, 570, 70, 70);
    //move to next page
    if ((mousePressed == true) && (mouseX >= 820 && mouseX <= 890 && mouseY >= 570 && mouseY <= 640)) {
      screen++;
    }
  }


  //Ninth Question Screen
  if (screen == 17) { //code reused from first question
    textSize(25);
    fill(96);
    rect(35, 80, 880, 40);
    fill(224);
    text("9th question,Which greenhouse gas is primarily responsible for global warming?", 45, 110);
    rect(35, 300, 100, 50);   //answer boxes
    rect(160, 300, 100, 50);
    rect(35, 400, 100, 50);
    rect(160, 400, 100, 50);
    fill(#D33535);
    textSize(25);
    text("(CO2)", 45, 335);
    text("(CH4)", 165, 335);
    text("(N2O)", 45, 435);
    text("(O3)", 165, 435);
    

    //if correct option is selected + 1 to score
    if ((mousePressed == true) && (mouseX >= 35 && mouseX <= 135 && mouseY >= 300 && mouseY <= 350)) {    //Clickable answer based on cursor location
      score++;
    }

    //move to next page
    if ((mousePressed == true) && (mouseX >= 35 && mouseX <= 135 && mouseY >= 300 && mouseY <= 350)) {
      screen++;
    }

    if ((mousePressed == true) && (mouseX >= 160 && mouseX <= 260 && mouseY >= 300 && mouseY <= 350)) {
      screen++;
    }

    if ((mousePressed == true) && (mouseX >= 35 && mouseX <= 135 && mouseY >= 400 && mouseY <= 450)) {
      screen++;
    }

    if ((mousePressed == true) && (mouseX >= 160 && mouseX <= 260 && mouseY >= 400 && mouseY <= 450)) {
      screen++;
    }
  }

  if (screen == 18) { //code reused from question 1 info page
    background(loadImage("InfoPage1.png"));
    textSize(30);
    fill(0);
    text("Click the recycling logo to proceed", 570, 80);
    textSize(25);
    text("CO2 is the primary greenhouse gas responsible for global warming.", 570, 140);
    text("Human activities like burning fossil fuels for energy and", 570, 180);
    text("deforestation release large amounts of carbon dioxide into the", 570, 220);
    text("catmosphere, increasing the concentration of CO2 leading to a ", 570, 260);
    text("warming of the earths surface.", 570, 300);


    //clickable image to change to next question/screen
    image(image2, 610, 360, 70, 70);
    //move to next page
    if ((mousePressed == true) && (mouseX >= 610 && mouseX <= 680 && mouseY >= 360 && mouseY <= 430)) {
      screen++;
    }
  }

//---------------------------------------------------------------------------------------------------------
  //tenth Question Screen
  if (screen == 19) { //code reused from first question
    textSize(25);
    fill(96);
    rect(35, 80, 850, 40);
    fill(224);
    text("10th question,What is the main contributor to an individual's carbon footprint?", 45, 110);
    rect(35, 300, 200, 50);   //answer boxes
    rect(245, 300, 210, 50);
    rect(35, 400, 200, 50);
    rect(245, 400, 210, 50);
    fill(#D33535);
    textSize(25);
    text("Clothing Choices", 45, 335);
    text("Food consumption", 250, 335);
    text("Energy usage", 45, 435);
    text("Transportation", 250, 435);
    

    //if correct option is selected + 1 to score
    if ((mousePressed == true) && (mouseX >= 245 && mouseX <= 455 && mouseY >= 400 && mouseY <= 450)) {
      score++;
    }

    //move to next page
    if ((mousePressed == true) && (mouseX >= 35 && mouseX <= 235 && mouseY >= 300 && mouseY <= 350)) {
      screen++;
    }

    if ((mousePressed == true) && (mouseX >= 245 && mouseX <= 455 && mouseY >= 300 && mouseY <= 350)) {
      screen++;
    }

    if ((mousePressed == true) && (mouseX >= 35 && mouseX <= 235 && mouseY >= 400 && mouseY <= 450)) {
      screen++;
    }

    if ((mousePressed == true) && (mouseX >= 245 && mouseX <= 455 && mouseY >= 400 && mouseY <= 450)) {
      screen++;
    }
  }

  if (screen == 20) { //code reused from question 1 info page
    background(loadImage("InfoPage1.png"));
    fill(0);
    text("Click the recycling logo to proceed", 570, 80);
    textSize(25);
    text("Transportation is the main contributer to an individuals ", 570, 140);
    text("carbon footprint. Especially in ireland as housing prices ", 570, 180);
    text("and rent rates are too high for the average worker in cities. because", 570, 220);
    text("Because of this they dont live near the city and opt to stay outside ", 570, 260);
    text("the city,increasing travel costs and fuel consumption daily.", 570, 300);

    //clickable image to change to next question/screen
    image(image2, 940, 460, 70, 70);
    //move to next page
    if ((mousePressed == true) && (mouseX >= 940 && mouseX <= 1010 && mouseY >= 460 && mouseY <= 530)) {
      screen++;
    }
  }
  
  //---------------------------------------------------------------------------------------------------------
  if (screen == 21) {
    background(229,204,255);
    textSize(25);
    fill(96);
    rect(35, 50, 450, 40);
    fill(224);
    text("Please place the trash in the correct bin", 45, 80);
    image(conveyor, 600, 500);
    //bin locations 
    fill(255,153,153);  
    rect(1000, 160, squareSize, squareSize);  //red glass bin
    fill(0);
    text("Glass",1000,140);
    fill(204,255,153);
    rect(700, 160, squareSize, squareSize);   //green recycling bin
    fill(0);
    text("Recycling",700,140);
    fill(255,255,153);  
    rect(400, 160, squareSize, squareSize);   //yellow plastic bin
    fill(0);
    text("Plastic",400,140);

    if (displayGlass) { //position of glass
      imageMode(CENTER);
      image(glass, x1, y1, 80, 154);
    }

    if (displayPaper) {  //position of paper
      imageMode(CENTER);
      image(paper, x2, y2, 80, 100);
    }
    
    if (displayPlastic) {  //position of plastic
      imageMode(CENTER);
      image(plastic, x3, y3, 80, 81);
    }
    
    //move to next page when all rubbish images are gone
    if (displayGlass == false && displayPaper == false && displayPlastic == false) { 
      screen = screen + 1;
    }
  }


//---------------------------------------------------------------------------------------------------------
  //EndScreen
  if (screen == 22) {
    textSize(40);
    fill(96);
    rect(35, 80, 600, 40);
    fill(224);
    text("Congrats, you survived to the end!", 45, 110);
    rect(35, 200, 100, 50);   //answer boxes
    rect(160, 200, 100, 50);
    fill(5);
    textSize(25);
    text("Retry", 55, 235);
    text("Exit", 180, 235);
    textSize(50);
    fill(255);
    text("Score", 55, 300);
    textSize(100);
    text(score, 90, 385);
    
    if(score == 0)
    {
      fill(96);
      rect(35, 480, 655, 40);
      textSize(25);
      fill(224);
      text("Skill Issue. you need to learn about sustainablity from scratch!",45, 510);
    }
    
    if(score >= 1 && score <=5)
    {
      fill(96);
      rect(35, 480, 580, 40);
      textSize(25);
      fill(224);
      text("Nice! A little bit of revision on sustainability is needed.",45, 510);
    }
    
    if(score >= 6 && score <=9)
    {
      fill(96);
      rect(35, 480, 400, 40);
      textSize(25);
      fill(224);
      text("Great! you understand sustainability.",45, 510);
    }



    //if retry pressed
    if ((mousePressed == true) && (mouseX >= 35 && mouseX <= 135 && mouseY >= 200 && mouseY <= 250)) {    //Clickable answer based on cursor location
      score = 0;
    }
    if ((mousePressed == true) && (mouseX >= 35 && mouseX <= 135 && mouseY >= 200 && mouseY <= 250)) {
      screen = 0;
    }


    //if exit pressed
    if ((mousePressed == true) && (mouseX >= 160 && mouseX <= 260 && mouseY >= 200 && mouseY <= 250))
    {
      exit();
    }
  }
}//end of Draw

//---------------------------------------------------------------------------------------------------------
void mousePressed() {
  // Check if the mouse is pressing on glass
  if (mouseX > x1 - 100 && mouseX < x1 + 100 && mouseY > y1 - 100 && mouseY < y1 + 100) {
    isDraggingGlass = true;
  }

  // Check if the mouse is pressing on paper
  if (mouseX > x2 - 100 && mouseX < x2 + 100 && mouseY > y2 - 100 && mouseY < y2 + 100) {
    isDraggingPaper = true;
  }

  // Check if the mouse is pressing on plastic 
  if (mouseX > x3 - 100 && mouseX < x3 + 100 && mouseY > y3 - 100 && mouseY < y3 + 100) {
    isDraggingPlastic = true;
  }
}

//---------------------------------------------------------------------------------------------------------
void mouseDragged() 
{
  // Check if the mouse is dragging the glass
  if (isDraggingGlass) 
  {
    x1 = mouseX;
    y1 = mouseY;

    // Check if the mouse is over the glass bin
    if (mouseX > 1000 && mouseX < 1080 && mouseY > 160 && mouseY < 240 && imageGlass.equals("glass")) 
    {
      // Set the boolean to false to make the glass vanish
      displayGlass = false;
      isDraggingGlass = false;
      score++;
    }
  }

  // Check if the mouse is dragging the paper
  if (isDraggingPaper) {
    x2 = mouseX;
    y2 = mouseY;

    // Check if the mouse is over the paper bin
    if (mouseX > 700 && mouseX < 780 && mouseY > 160 && mouseY < 240 && imagePaper.equals("paper")) {
      // Set the boolean to false to make the paper vanish
      displayPaper = false;
      isDraggingPaper = false;
      score++;
    }
  }

  // Check if the mouse is dragging the plastic
  if (isDraggingPlastic) {
    x3 = mouseX;
    y3 = mouseY;

    // Check if the mouse is over the plastic bin
    if (mouseX > 400 && mouseX < 480 && mouseY > 160 && mouseY < 240 && imagePlastic.equals("plastic")) {
      // Set the boolean to false to make the plastic vanish
      displayPlastic = false;
      isDraggingPlastic = false;
      score++;
    }
  }
}

//---------------------------------------------------------------------------------------------------------
void mouseReleased() {
  // Reset the dragging flags when the mouse is released
  isDraggingGlass = false;
  isDraggingPaper = false;
  isDraggingPlastic = false;
}

//stops the music when program is closed
void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
